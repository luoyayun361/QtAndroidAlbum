#include "androidjniinterface.h"
#include <QAndroidJniObject>
#include <QDebug>

AndroidJniInterface *AndroidJniInterface::Instance()
{
    static AndroidJniInterface * instance = nullptr;
    if(!instance){
        instance = new AndroidJniInterface();
    }
    return  instance;
}

QList<AlbumInfo> AndroidJniInterface::getPhotoAlbumInfo()
{
    QList<AlbumInfo> abInfoList;
    QAndroidJniObject string = QAndroidJniObject::callStaticObjectMethod("com/lynn/album/MainActivity" ,
                                                                         "getPhotoAlbumInfo",                                                                      "()Ljava/lang/String;");
    QStringList albumInfoList = string.toString().split("#");
    albumInfoList.removeLast();//最后一个为空
    foreach (QString info, albumInfoList) {
        AlbumInfo abInfo;
        QStringList list = info.split(";");
        abInfo.setPhotoNum(list.last().toInt());
        QString path = list.first();
        abInfo.setFirstImagePath(path);
        int index = path.lastIndexOf("/");
        QString str = path.left(index);
        abInfo.setAlbumPath(str);
        abInfo.setAlbumName(str.right(str.size() - str.lastIndexOf("/") - 1));

        abInfoList.append(abInfo);
    }
    qDebug() << "--->>>Lynn<<<---" << __FUNCTION__ << albumInfoList;

    return abInfoList;
}
