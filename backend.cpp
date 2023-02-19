#include "backend.h"

Backend::Backend()
{
    connect(&client, &TcpClient::loginSucceed, this, &Backend::loginSucceed);
    connect(&client, &TcpClient::loginFailed, this, &Backend::loginFailed);

    client.connectToHost("localhost", "30391");
}

