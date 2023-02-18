#ifndef HASH_H
#define HASH_H

#include <QString>
#include <QPasswordDigestor>
#include <QCryptographicHash>
#include <QByteArray>

class Hash
{
public:
    Hash();
    static QByteArray password(const QString& password, const QString &salt)
    {
        return QPasswordDigestor::deriveKeyPbkdf2(QCryptographicHash::Sha256,
                                           password.toUtf8(), salt.toUtf8(),
                                           1024, 16);
    }
    static QByteArray getSalt(const QString& login)
    {
        return QCryptographicHash::hash(login.toUtf8(), QCryptographicHash::Sha256);
    }
};

#endif // HASH_H
