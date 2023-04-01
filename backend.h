#ifndef BACKEND_H
#define BACKEND_H
#pragma once
#include <QObject>
#include <QVariant>
#include "hash.h"
#include "TcpClient.h"
#include <QTextCodec>
#include <QGuiApplication>
#include "cache.h"

class Backend : public QObject
{
    Q_OBJECT
public:
    explicit Backend(QGuiApplication *app);

private:
    TcpClient client;
    Cache cache;
    QPair<QString, QByteArray> lastLoginData;
public slots:
    ///
    /// \brief isUserAlreadyAuthorized
    /// Функция вернет true, если на устройстве содержится информация
    /// о сессии пользователя, иначе false.
    /// \return
    ///
    bool isLastSessionSaved();
    ///
    /// \brief getLastSession
    /// Функция возвращает информацию о прошлой сессии в виде словаря.
    /// Вернет пустой словарь, если нет сохраненной сессии.
    /// \return
    ///
    QVariant getLastSession();
    ///
    /// \brief implicitLogin
    /// Функция производит неявную авторизацию пользователя
    /// по данным из последней сессии.
    /// \return
    ///
    void implicitLogin();
    ///
    /// \brief login
    /// Функция производит явную авторизацию
    /// \return
    ///
    void login(QString login, QString password);
    ///
    ///
    ///
    ///
    ///
    void getMessages(QString chatID);
    ///
    ///
    ///
    ///
    ///
    QString myID();
    ///
    ///
    ///
    ///
    ///
    void sendMessage(QString chatID, QString message);
    ///
    /// \brief forceSocketDrop
    ///
    ///
    ///
    void forceSocketDrop();
    void forceSocketConnect();
    void getSessionData(QString chatID);


signals:
    ///
    /// \brief loginSucceed
    ///
    void loginSucceed();
    void loginFailed();
    void serverUnreachable();

    void newChatListElement(QStringList chatData);
    void clearMessages();
    void newMessage(QStringList messageData);

    void newSessionData(QStringList sessionData);
};

#endif // BACKEND_H
