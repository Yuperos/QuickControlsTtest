#ifndef SIGNALHANDLER_H
#define SIGNALHANDLER_H

#include <QObject>
#include <QVariant>

class SignalHandler : public QObject
   {
   Q_OBJECT
public:
   explicit SignalHandler(QObject *parent = 0);

signals:

public slots:
   void cppSlot(const QString &msg);
   };

#endif // SIGNALHANDLER_H
