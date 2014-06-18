#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "notificationclient.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    NotificationClient *notificationClient = new NotificationClient(&engine);
    engine.rootContext()->setContextProperty(QLatin1String("notificationClient"),
                                                     notificationClient);
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
