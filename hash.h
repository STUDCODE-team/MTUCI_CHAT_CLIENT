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
    static QByteArray password(const QString& password, const QString &salt);
    static QByteArray getSalt(const QString& login);
};

#endif // HASH_H
