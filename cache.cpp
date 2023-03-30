#include "cache.h"
#include <QDebug>

typedef QPair<QString, QByteArray> LoginData;

Cache::Cache()
{
    settings = new QSettings("my_cache.ini", QSettings::IniFormat);
    cache = settings->value("cache").value<QMap<QString, QVariant>>();
}

void Cache::setLogin(LoginData loginData)
{
    QStringList s = {loginData.first, QString::fromLocal8Bit(loginData.second)};
    cache.insert("loginData", QVariant::fromValue(s));
}

bool Cache::isLogin(){
    return cache.contains("loginData");
}

QString Cache::getLogin(){
    return  cache["loginData"].value<QStringList>()[0];
}

QByteArray Cache::getPassword(){
     return cache["loginData"].value<QStringList>()[1].toLocal8Bit();
}

void Cache::saveCache()
{
    //autologin
    cache.remove("loginData");
    settings->setValue("cache", cache);
    settings->sync();
}
