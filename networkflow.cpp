#include "networkflow.h"


void NetworkFlow::loadProxyPack(){
    qDebug() << "Настройка прокси...";
    QNetworkProxy::setApplicationProxy(QNetworkProxy::DefaultProxy);
    qDebug() << "Установлен прокси по умолчанию";
}

void NetworkFlow::monitorNetwork(){
    QTimer *timer = new QTimer();
    connect(timer, &QTimer::timeout, this, &NetworkFlow::checkNet);
    timer->start(3000);
}

void NetworkFlow::checkNet()
{
    reply = nam->get(QNetworkRequest(QUrl("http://google.com")));
    QEventLoop loop;
    QObject::connect(reply, SIGNAL(readyRead()), &loop, SLOT(quit()));
    QObject::connect(nam, SIGNAL(finished(QNetworkReply*)), &loop, SLOT(quit()));
    if(!reply->isFinished())
        loop.exec();
    if(reply->error()==QNetworkReply::NoError)
        emit netAvailable();
    else
        emit netClosed();
}
