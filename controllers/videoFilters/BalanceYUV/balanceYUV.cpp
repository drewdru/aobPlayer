#include "balanceYUV.h"
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>
#include <QtQuick/QQuickImageProvider>
#include <QDebug>

#include <iostream>


BalanceYUVRunnable::BalanceYUVRunnable(BalanceYUV *parent) :
    filter_parent(parent)
{

}

QVideoFrame BalanceYUVRunnable::run(QVideoFrame *input,
                      const QVideoSurfaceFormat &surfaceFormat,
                      RunFlags flags)
{
    Q_UNUSED(surfaceFormat);
    Q_UNUSED(flags);

//    qDebug() << input->pixelFormat();
//    qDebug() << input->handleType();

    if (!input->isValid())
        return *input;

    if (!input->map(QAbstractVideoBuffer::ReadOnly)) {
        return *input;
    }
    if (input->pixelFormat() != QVideoFrame::Format_YUV420P &&
            input->pixelFormat() != QVideoFrame::Format_NV12 &&
            input->pixelFormat() != QVideoFrame::Format_NV21) {
        return *input;
    }
    this->changeYUV(input);
    input->unmap();

    emit filter_parent->finished(*(filter_parent->_result)); // publish results to

    return *input;
}

void BalanceYUVRunnable::changeValue(uchar* inputBits, size_t from, size_t to,
        uchar maxValue, uchar newValueY, bool isRound)
{
    for (int i = from; i < to; i+=1) {
        float newValue = float(inputBits[i]) + newValueY;
        if (newValue > maxValue) newValue = maxValue;
        if (newValue < 0) newValue = 0;
        if (isRound) newValue = qRound(newValue/2);
        inputBits[i] = newValue;
    }
}

void BalanceYUVRunnable::changeYUV(QVideoFrame *input)
{
    // Assign 127 to Us and Vs
    int firstU = input->width()*input->height(); // if i correctly understand YUV420
    int lastV = input->mappedBytes();

    uchar* inputBits = input->bits();
    switch (this->filter_parent->currentMode) {
    case YUVColorsMode::Y:
        this->changeValue(inputBits, 0, firstU, 255,
                this->filter_parent->newValueY, false);
        break;
    case YUVColorsMode::U:
        this->changeValue(inputBits, firstU, (firstU+lastV)/2, 127,
                this->filter_parent->newValueU, true);
        break;
    case YUVColorsMode::V:
        this->changeValue(inputBits, (firstU+lastV)/2, lastV, 127,
                this->filter_parent->newValueV, true);
        break;
    case YUVColorsMode::UV:
        this->changeValue(inputBits, firstU, (firstU+lastV)/2, 127,
                this->filter_parent->newValueU, true);
        this->changeValue(inputBits, (firstU+lastV)/2, lastV, 127,
                this->filter_parent->newValueV, true);
        break;
    case YUVColorsMode::YUV:
        this->changeValue(inputBits, 0, firstU, 255,
                this->filter_parent->newValueY, false);
        this->changeValue(inputBits, firstU, (firstU+lastV)/2, 127,
                this->filter_parent->newValueU, true);
        this->changeValue(inputBits, (firstU+lastV)/2, lastV, 127,
                this->filter_parent->newValueV, true);
        break;
    default:
        break;
    }
}

BalanceYUV::BalanceYUV(QAbstractVideoFilter *parent) :
    QAbstractVideoFilter(parent),
    _result(new QPointF(-1.,-1.))
{

}

QVideoFilterRunnable* BalanceYUV::createFilterRunnable()
{
    return new BalanceYUVRunnable(this); // gets automatically deleted
}

void BalanceYUV::setResult(float x, float y)
{
    this->_result->setX(x);
    this->_result->setY(y);
}
