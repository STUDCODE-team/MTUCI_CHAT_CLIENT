#include "backend.h"

Backend::Backend(QGuiApplication *app)
{
    connect(app, &QGuiApplication::aboutToQuit, &cache, &Cache::saveCache);
    connect(&client, &TcpClient::loginSucceed, this, [this](){
        cache.setLogin(lastLoginData);
        emit loginSucceed();
        client.getChatList();
    });
    connect(&client, &TcpClient::loginFailed, this, [this](){
        emit loginFailed();
    });
    connect(&client, &TcpClient::socketConnected, this, [this](){
        if(cache.isLogin()){
            client.login(cache.getLogin(), cache.getPassword());
        }
    });
    connect(&client, &TcpClient::newChatListElement, this, &Backend::newChatListElement);
    connect(&client, &TcpClient::addMessage, this, &Backend::addMessage);

    client.connectToHost("localhost", "30391");
//    client.connectToHost("nastie.online", "30391");
}

bool Backend::isLastSessionSaved() {return false;}

QVariant Backend::getLastSession() {return QVariant(3);}

void Backend::implicitLogin(){}

void Backend::login(QString login, QString password)
{
    QByteArray salt = Hash::getSalt(login).toHex();
    QByteArray hashedPassword = Hash::password(password, salt).toHex();
    lastLoginData = {login, hashedPassword};
    client.login(login, hashedPassword);
}

void Backend::getMessages(QString chatID)
{
    emit clearMessages();
    client.getMessages(chatID);
}

QString Backend::myID()
{
    return QString::number(client.userID);
}

void Backend::sendMessage(QString chatID, QString message)
{
    client.sendMessage(chatID, message);
}

void Backend::forceSocketDrop(){
    if(client.getSocketState() == QTcpSocket::ConnectedState){
        client.netAvailable = false;
        qDebug() << "[SOCKET]: Отключение сокета из-за отсутствия сети";
        client.closeSocket();
        qDebug() << "[SOCKET]: Ожидание сети...";
    }
}

void Backend::forceSocketConnect(){
    if(client.getSocketState() != QTcpSocket::ConnectedState){
        client.netAvailable = true;
        qDebug() << "[SOCKET]: Сеть дооступна";
        client.reconnect();
    }
}

