#ifndef BACKEND_H
#define BACKEND_H
#pragma once
#include <QObject>
#include <QVariant>
#include "hash.h"
#include "TcpClient.h"
#include <QTextCodec>

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend();
    TcpClient client;

public slots:
    ///
    /// \brief isUserAlreadyAuthorized
    /// Функция вернет true, если на устройстве содержится информация
    /// о сессии пользователя, иначе false.
    /// \return
    ///
    bool isLastSessionSaved() {return false;}
    ///
    /// \brief getLastSession
    /// Функция возвращает информацию о прошлой сессии в виде словаря.
    /// Вернет пустой словарь, если нет сохраненной сессии.
    /// \return
    ///
    QVariant getLastSession() {return QVariant(3);}
    ///
    /// \brief implicitLogin
    /// Функция производит неявную авторизацию пользователя
    /// по данным из последней сессии.
    /// \return
    ///
    void implicitLogin(){}
    ///
    /// \brief login
    /// Функция производит явную авторизацию
    /// \return
    ///
    void login(QString login, QString password)
    {
        QByteArray salt = Hash::getSalt(login).toHex();
        QByteArray hashedPassword = Hash::password(password, salt).toHex();
        client.login(login, hashedPassword);
    }
    ///
    ///
    ///
    void getMessages(QString chatID)
    {
        emit clearMessages();
        client.getMessages(chatID);
    }
    ///
    ///
    ///
    QString myID()
    {
        return QString::number(client.userID);
    }
    ///
    ///
    ///
    void sendMessage(QString chatID, QString message)
    {
        client.sendMessage(chatID, message);
    }

signals:
    ///
    /// \brief loginSucceed
    ///
    void loginSucceed();
    void loginFailed();
    void serverUnreachable();

    void newChatListElement(QStringList chatData);
    void clearMessages();
    void addMessage(QStringList messageData);
};

#endif // BACKEND_H
