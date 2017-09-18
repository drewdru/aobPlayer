#include "videocontroller.h"

videoController::videoController(QObject *parent) : QObject(parent)
{

}
void videoController::setAuthor(const QString &a)
{

}
QString videoController::author()
{
    return m_author;
}
