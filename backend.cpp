#include "backend.h"

Backend::Backend()
{
    connect(&client, &TcpClient::loginSucceed, this, [this](){
        emit loginSucceed();
        client.getChatList();
    });
    connect(&client, &TcpClient::loginFailed, this, &Backend::loginFailed);
    connect(&client, &TcpClient::newChatListElement, this, &Backend::newChatListElement);
    connect(&client, &TcpClient::addMessage, this, &Backend::addMessage);

    client.connectToHost("localhost", "30391");
}

