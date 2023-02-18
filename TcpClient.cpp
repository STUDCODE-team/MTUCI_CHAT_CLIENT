#include "TcpClient.h"


TcpClient::TcpClient()
{
    connect(&_socket,      &QTcpSocket::readyRead, this, &TcpClient::onReadyRead);
    connect(&reconn_timer, &QTimer::timeout,       this, &TcpClient::reconnect);

    connect(&_socket, &QTcpSocket::stateChanged, this, [&]()
    {
        #ifdef QT_DEBUG
            qDebug() << _socket.state();
        #endif
        reconn_timer.stop();
        if (_socket.state() == QTcpSocket::ConnectingState
         || _socket.state() == QTcpSocket::UnconnectedState)
        {
            reconn_timer.start(3000);
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

    if(messageType(rep)=="login")
    {
        (messageBody(rep) =="ok")? emit loginSucceed() : emit loginFailed();
    }
}

