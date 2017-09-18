#include "myfilter.h"
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>
#include <QtQuick/QQuickImageProvider>
#include <QDebug>

#include <iostream>


MyFilterRunnable::MyFilterRunnable(MyFilter *parent) :
    filter_parent(parent)
{

}

QVideoFrame MyFilterRunnable::run(QVideoFrame *input,
                      const QVideoSurfaceFormat &surfaceFormat,
                      RunFlags flags)
{
    Q_UNUSED(surfaceFormat);
    Q_UNUSED(flags);

//    qDebug() << input->pixelFormat();
    //qDebug() << input->handleType();

    // convert input to cv::mat here
    if (!input->isValid())
        return *input;

    if (!input->map(QAbstractVideoBuffer::ReadOnly)) {
        qDebug() << "FAIL!";
        return *input;
    }
//    cv::Mat mat;
    if (input->pixelFormat() == QVideoFrame::Format_YUV420P ||
        input->pixelFormat() == QVideoFrame::Format_NV12 ||
        input->pixelFormat() == QVideoFrame::Format_NV21)
    {
        this->deleteColorComponentFromYUV(input); // nicht unbedingt nötig

        // extracts gray channel from yuv image
//        mat = cv::Mat(input->height(), input->width(), CV_8UC1,
//                      input->bits(), input->bytesPerLine());

    }
    else
        return *input;

    // do some calculations here, save in results

    input->unmap();

    emit filter_parent->finished(*(filter_parent->_result)); // publish results to

    return *input;
}

void MyFilterRunnable::deleteColorComponentFromYUV(QVideoFrame *input)
{
    // Assign 127 to Us and Vs
    int firstU = input->width()*input->height(); // if i correctly understand YUV420
    int lastV = input->mappedBytes();

    uchar* inputBits = input->bits();
    qDebug() << firstU << " " << lastV;
//    // Y
//    for (int i = 0; i < firstU; i+=1) {
//        inputBits[i] = 127;
//    }
//    // U
//    for (int i = firstU; i < (firstU+lastV)/2; i+=1) {
//        inputBits[i] = 127;
//    }
    // U
    for (int i = (firstU+lastV)/2; i < lastV; i+=1) {
        inputBits[i] = 127;
    }
}

MyFilter::MyFilter(QAbstractVideoFilter *parent) :
    QAbstractVideoFilter(parent),
    _result(new QPointF(-1.,-1.))
{

}

QVideoFilterRunnable* MyFilter::createFilterRunnable()
{
    return new MyFilterRunnable(this); // gets automatically deleted
}

void MyFilter::setResult(float x, float y)
{
    this->_result->setX(x);
    this->_result->setY(y);
}
