#ifndef CACHE_H
#define CACHE_H
#include <QObject>
#include <QSettings>
#include <QVariant>
#include <QMap>

class Cache : public QObject
{
    Q_OBJECT
public:
    explicit Cache();

    void setLogin(QPair<QString, QByteArray> loginData);
    bool isLogin();
    QString getLogin();
    QByteArray getPassword();
private:
    QMap<QString, QVariant> cache;
    QSettings* settings;
public slots:
    void saveCache();

signals:

};

#endif // CACHE_H
