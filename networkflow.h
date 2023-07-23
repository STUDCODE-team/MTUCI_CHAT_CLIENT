#ifndef NETWORKFLOW_H
#define NETWORKFLOW_H

#include <QObject>
#include <QNetworkReply>
#include <QNetworkProxyFactory>
#include <QNetworkProxy>
#include <QTimer>
#include <QEventLoop>

class NetworkFlow : public QObject
{
    Q_OBJECT
public:
    void loadProxyPack();

    void monitorNetwork();

private:
    QNetworkAccessManager *nam = new QNetworkAccessManager();
    QNetworkReply *reply;

    void checkNet();
signals:
    void netClosed();
    void netAvailable();
};

#endif // NETWORKFLOW_H
