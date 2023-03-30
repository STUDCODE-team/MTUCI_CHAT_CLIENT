#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "backend.h"
#include <QFont>
#include "cache.h"
#include <QNetworkConfigurationManager>
#include <QNetworkAccessManager>
#include "networkflow.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    NetworkFlow net;
    net.loadProxyPack();

    Backend *back = new Backend(&app);

    QObject::connect(&net, &NetworkFlow::netClosed, back, &Backend::forceSocketDrop);
    QObject::connect(&net, &NetworkFlow::netAvailable, back, &Backend::forceSocketConnect);

    net.monitorNetwork();
    engine.rootContext()->setContextProperty("backend", back);

    engine.load(url);

    QFont serifFont(":/OpenSans-Regular.ttf");
    QGuiApplication::setFont(serifFont);


    return app.exec();
}

