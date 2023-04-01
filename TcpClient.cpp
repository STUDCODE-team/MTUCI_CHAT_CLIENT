#include <sys/socket.h>
#include "TcpClient.h"
#include <QNetworkConfigurationManager>


TcpClient::TcpClient()
{
    connect(&_socket,      &QTcpSocket::readyRead, this, &TcpClient::onReadyRead);
    connect(&reconn_timer, &QTimer::timeout,       this, &TcpClient::reconnect);
    connect(&_socket, &QTcpSocket::stateChanged, this, [&]()
    {
        reconn_timer.stop();

            if(_socket.state() == QTcpSocket::ConnectedState){
                #ifdef QT_DEBUG
                    qDebug() << "[SOCKET]: Подключено к серверу";
                #endif
                emit socketConnected();
            }
        if (_socket.state() == QTcpSocket::UnconnectedState && netAvailable)
        {
            reconn_timer.start(3000);
            #ifdef QT_DEBUG
                qDebug() << "[SOCKET]: Ошибка подключения, повтор через 3 секунды...";
            #endif
        }
    });
}

void TcpClient::connectToHost(const QString ip, const QString port)
{
    this->ip = ip;
    this->port = port;
    _socket.connectToHost(ip, port.toUInt());
}

void TcpClient::closeSocket(){
    _socket.close();
}

void TcpClient::reconnect()
{   if(_socket.state() != QTcpSocket::UnconnectedState){
        _socket.disconnectFromHost();
        _socket.waitForDisconnected(300);
    }
    _socket.connectToHost(ip, port.toUInt());
}

void TcpClient::getSessionData(QString chatID)
{
    send("getSessionData:" + chatID.toUtf8());
}

void TcpClient::send(const QByteArray &message)
{
    _socket.flush();
    _socket.write(message + "#");

#ifdef QT_DEBUG
        qInfo() << QTime::currentTime().toString() << "SEND: \t" << message;
#endif
}

void TcpClient::login(const QString &login, const QByteArray &hashedPassword){
    send("login:" + login.toUtf8() + "|" + hashedPassword);
}

void TcpClient::getChatList(){
    send("getChatList:" + QString::number(userID).toUtf8());
}

void TcpClient::getMessages(QString chatID)
{
    send("getMessages:" + chatID.toUtf8());
}

void TcpClient::sendMessage(QString chatID, QString message)
{
    send("newMessage:" + chatID.toUtf8() + ":" + QString::number(userID).toUtf8() + ":" + message.toUtf8());
}

QAbstractSocket::SocketState TcpClient::getSocketState()
{
    return _socket.state();
}

void TcpClient::onReadyRead()
{
    //    replies are separatied with '#'
    const QList<QByteArray> m_list = _socket.readAll().split('#');
    // parsing reply to single ones
    foreach(QByteArray message, m_list)
    {
        if(!message.isEmpty()) reply(message);
    }
}

void TcpClient::reply(const QByteArray &rep)
{
#ifdef QT_DEBUG
        qInfo() << QTime::currentTime().toString() << "GET: \t" << rep.data();
#endif
    if(messageType(rep) == "login")
    {
        if (messageBody(rep) != "fail")
        {
            userID = messageBody(rep).toInt();
            emit loginSucceed();
        }
        else
        {
            emit loginFailed();
        }
        return;
    }
    if(messageType(rep) == "chatList")
    {
        QStringList info = messageBody(rep).split("|");
        emit newChatListElement(info);
        return;
    }
    if(messageType(rep) == "Message")
    {
        QStringList info = messageBody(rep).split("|");
        emit newMessage(info);
        return;
    }
    if(messageType(rep) == "sessionData")
    {
        QStringList info = messageBody(rep).split("|");
        emit newSessionData(info);
        return;
    }
}

QString TcpClient::messageType(QString message){
    return message.split(":")[0];
}

QString TcpClient::messageBody(QString message){
    QStringList m = message.split(":");
    m.removeFirst();
    return m.join(":");
}

