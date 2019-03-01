#include "datamanager.h"
#include "androidjniinterface.h"
#include <QDebug>
#include <QListIterator>
#include <QTimer>

DataManager::DataManager(QObject *parent) : QObject(parent)
{
    QTimer::singleShot(1000,this,[=](){
        initAlbumPath(AJni->getPhotoAlbumInfo());
    });
}

void DataManager::initAlbumPath(QList<AlbumInfo> list)
{
    QListIterator<AlbumInfo> it(list);
    while (it.hasNext()) {
        AlbumInfo info = (it.next());
        emit addDirModelData(info.getAlbumName(),
                             info.getAlbumPath(),
                             info.getPhotoNum(),
                             info.getFirstImagePath());
    }
}
