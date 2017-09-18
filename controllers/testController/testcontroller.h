#ifndef TESTCONTROLLER_H
#define TESTCONTROLLER_H

#include <QObject>

class testController : public QObject
{
    Q_OBJECT
public:
    explicit testController(QObject *parent = nullptr);

signals:

public slots:
};

#endif // TESTCONTROLLER_H