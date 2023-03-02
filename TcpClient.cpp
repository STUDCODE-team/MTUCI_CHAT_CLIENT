#include "TcpClient.h"

TcpClient::TcpClient()
{
    connect(&_socket,      &QTcpSocket::readyRead, this, &TcpClient::onReadyRead);
    connect(&reconn_timer, &QTimer::timeout,       this, &TcpClient::reconnect);
    connect(&_socket, &QTcpSocket::stateChanged, this, [&]()
    {
        reconn_timer.stop();
        #ifdef QT_DEBUG
            if(_socket.state() == QTcpSocket::ConnectedState)
                qDebug() << "[SOCKET]: Подключено к серверу";
        #endif
        if (_socket.state() == QTcpSocket::ConnectingState
            || _socket.state() == QTcpSocket::UnconnectedState)
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

void TcpClient::reconnect()
{
    _socket.disconnectFromHost();
    _socket.waitForDisconnected(1000);
    _socket.connectToHost(ip, port.toUInt());
}

void TcpClient::send(const QByteArray &message)
{
    _socket.flush();
    _socket.write(message);

#ifdef QT_DEBUG
        qInfo() << QTime::currentTime().toString() << "SEND: \t" << message;
#endif
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
        qInfo() << QTime::currentTime().toString() << "GET: \t" << rep;
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

}

