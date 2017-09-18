#ifndef MYCOOLSTUFF_H
#define MYCOOLSTUFF_H

#include <QObject>
#include <QAbstractVideoFilter>

class MyFilter; // forward declaration

class MyFilterRunnable : public QVideoFilterRunnable
{
public:
    MyFilterRunnable(MyFilter *parent = 0);
    QVideoFrame run(QVideoFrame *input,
                    const QVideoSurfaceFormat &surfaceFormat,
                    RunFlags flags);

private:
    void deleteColorComponentFromYUV(QVideoFrame*);
    MyFilter *filter_parent;

};

class MyFilter : public QAbstractVideoFilter
{
    Q_OBJECT
public:
    explicit MyFilter(QAbstractVideoFilter *parent = 0);

    QVideoFilterRunnable* createFilterRunnable();
    QPointF *_result;
    Q_INVOKABLE void setResult(float, float);

private:

signals:
    void finished(QPointF result);

};

#endif // MYCOOLSTUFF_H
