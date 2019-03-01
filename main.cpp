#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "androidjniinterface.h"
#include "datamanager.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    DataManager dataManager;
    engine.rootContext()->setContextProperty("dataManager",&dataManager);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
