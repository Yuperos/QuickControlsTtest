#include <QApplication>
#include <QQmlApplicationEngine>

#include "signalhandler.h"

int main(int argc, char *argv[])
   {
   QApplication app(argc, argv);

   QQmlApplicationEngine engine;
   engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

   QObject* root = engine.rootObjects()[0];

   SignalHandler *signalHandler = new SignalHandler(root);

   QObject::connect(root, SIGNAL(qmlSignal(QString)),
   signalHandler, SLOT(cppSlot(QString)));

   return app.exec();
   }
