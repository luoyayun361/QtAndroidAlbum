#ifndef DATAMANAGER_H
#define DATAMANAGER_H

#include <QObject>
#include "albuminfo.h"


class DataManager : public QObject
{
    Q_OBJECT
public:
    explicit DataManager(QObject *parent = nullptr);
    enum AlbumInfoType{
        AlbumName = 0, //相册名
        AlbumPath , //相册路径
        PhotoNum , //相片数量
        FirstImagePath  //第一张相片的路径  ，用于设置相册封面
    };
    void initAlbumPath(QList<AlbumInfo> list);
signals:
    void addDirModelData(QString name,QString url,int num,QString firstPath);

};

#endif // DATAMANAGER_H
