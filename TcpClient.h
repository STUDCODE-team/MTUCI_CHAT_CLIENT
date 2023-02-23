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

public slots:
    void send(const QByteArray &message);
    void login(const QString& login, const QByteArray& hashedPassword){
        send("login:" + login.toUtf8() + "|" + hashedPassword);
    }
    void getChatList(){
        send("getChatList:" + QString::number(userID).toUtf8());
    }

private slots:
    void onReadyRead();

signals:
    ///
    /// \brief loginSucceed
    ///
    void loginSucceed();
    void loginFailed();

    void newChatListElement(QString chatID, QString usrID, QString usrName, QString usrAvatarPath);

private:
    QTcpSocket _socket;
    QString ip;
    QString port;
    QTimer reconn_timer;
    void reconnect();
    void reply(const QByteArray &rep);

    QString messageType(QString message){
        return message.split(":")[0];
    }
    QString messageBody(QString message){
        QStringList m = message.split(":");
        m.removeFirst();
        return m.join(":");
    }

};

#endif // TCPCLIENT_H
