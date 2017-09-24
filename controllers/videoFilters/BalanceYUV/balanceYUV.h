#ifndef BALANCEYUV_H
#define BALANCEYUV_H

#include <QObject>
#include <QAbstractVideoFilter>

class BalanceYUV; // forward declaration
enum class YUVColorsMode : std::uint8_t {NONE, Y, U, V, UV, YUV};
class BalanceYUVRunnable : public QVideoFilterRunnable
{
public:
    BalanceYUVRunnable(BalanceYUV *parent = 0);
    QVideoFrame run(QVideoFrame *input,
                    const QVideoSurfaceFormat &surfaceFormat,
                    RunFlags flags);
private:
    void changeYUV(QVideoFrame*);
    void changeValue(uchar*inputBits, size_t from, size_t to,
            uchar maxValue, int newValueY);
    BalanceYUV *filter_parent;
};

class BalanceYUV : public QAbstractVideoFilter
{
    Q_OBJECT
public:
    explicit BalanceYUV(QAbstractVideoFilter *parent = 0);
    QVideoFilterRunnable* createFilterRunnable();
    QPointF *_result;
    Q_INVOKABLE void setResult(float, float);
    Q_INVOKABLE void setY(int value);
    Q_INVOKABLE void setU(int value);
    Q_INVOKABLE void setV(int value);

    YUVColorsMode currentMode = YUVColorsMode::YUV;
    int newValueY = 0;
    int newValueU = 0;
    int newValueV = 0;
signals:
    void finished(QPointF result);
};

#endif // BALANCEYUV_H
