#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QTimer>

#ifdef QT_DEBUG
    #include <QTime>
#endif

class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient();
    int userID = -1;
    void connectToHost(const QString ip, const QString port);
    void closeSocket();
    bool netAvailable = true;
public slots:
    void send(const QByteArray &message);
    void login(const QString& login, const QByteArray& hashedPassword);
    void getChatList();
    void getMessages(QString chatID);
    void sendMessage(QString chatID, QString message);
    QTcpSocket::SocketState getSocketState();
    void reconnect();

    void getSessionData(QString chatID);

private slots:
    void onReadyRead();

signals:
    ///
    /// \brief loginSucceed
    ///
    void socketConnected();
    void loginSucceed();
    void loginFailed();

    void newChatListElement(QStringList chatData);
    void newMessage(QStringList messageData);
    void newSessionData(QStringList sessionData);


private:
    QTcpSocket _socket;
    QString ip;
    QString port;
    QTimer reconn_timer;

    void reply(const QByteArray &rep);

    QString messageType(QString message);
    QString messageBody(QString message);
};

#endif // TCPCLIENT_H
