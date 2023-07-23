#include "hash.h"

Hash::Hash()
{

}

QByteArray Hash::password(const QString &password, const QString &salt)
{
    return QPasswordDigestor::deriveKeyPbkdf2(QCryptographicHash::Sha256,
                                              password.toUtf8(), salt.toUtf8(),
                                              1024, 32);
}

QByteArray Hash::getSalt(const QString &login)
{
    return QCryptographicHash::hash(login.toUtf8(), QCryptographicHash::Sha256);
}
