#ifndef VIDEOCONTROLLER_H
#define VIDEOCONTROLLER_H

#include <QObject>

class videoController : public QObject
{
    Q_OBJECT
public:
    explicit videoController(QObject *parent = nullptr);
    void setAuthor(const QString &a);
    QString author();
private:
    QString m_author;

signals:
    void authorChanged();
public slots:
};

#endif // VIDEOCONTROLLER_H
