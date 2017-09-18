#include <QtCore/QCommandLineParser>
#include <QQmlApplicationEngine>
#include <QtQml/QQmlContext>
#include <QGuiApplication>
#include <QStyleHints>
#include <QScreen>
#include <QDir>

#include "./controllers/backEndController/backend.h"
#include "./controllers/videocontroller/videocontroller.h"
#include "./controllers/myfilterController/myfilter.h"

//Qt + GStreamer
//https://github.com/wang-bin/QtAV
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

//    qmlRegisterType<BackEnd>("backEnd", 1, 0, "BackEnd");
    qmlRegisterType<MyFilter>("my.filter", 1, 0, "MyFilter");
//    qmlRegisterType<videoController>("videocontroller", 1, 0,
//                                     "videoController");

    QCommandLineParser parser;
    QGuiApplication::setApplicationVersion(QT_VERSION_STR);
    parser.setApplicationDescription(QGuiApplication::applicationDisplayName());
    parser.addHelpOption();
    parser.addVersionOption();
    parser.process(app);

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    QRect geometry = QGuiApplication::primaryScreen()->availableGeometry();
    if (!QGuiApplication::styleHints()->showIsFullScreen()) {
        const QSize size = geometry.size() * 4 / 5;
        const QSize offset = (geometry.size() - size) / 2;
        const QPoint pos = geometry.topLeft() +
                QPoint(offset.width(), offset.height());
        geometry = QRect(pos, size);
    }

    context->setContextProperty(QStringLiteral("initialX"), geometry.x());
    context->setContextProperty(QStringLiteral("initialY"), geometry.y());
    context->setContextProperty(QStringLiteral("initialWidth"),
                                geometry.width());
    context->setContextProperty(QStringLiteral("initialHeight"),
                                geometry.height());

    context->setContextProperty(QStringLiteral("initialHeight"),
                                geometry.height());
    engine.rootContext()->setContextProperty("appDir",
            "file://" + QGuiApplication::applicationDirPath());

    engine.load(QUrl(QStringLiteral("qrc:/qml/mainWindow/main.qml")));

    return app.exec();
}
