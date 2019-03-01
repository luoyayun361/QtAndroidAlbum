#ifndef ANDROIDJNIINTERFACE_H
#define ANDROIDJNIINTERFACE_H

#include <QObject>
#include "albuminfo.h"

#define AJni AndroidJniInterface::Instance()

class AndroidJniInterface : public QObject
{
    Q_OBJECT
public:
    static AndroidJniInterface * Instance();

    Q_INVOKABLE QList<AlbumInfo> getPhotoAlbumInfo();

private:
    explicit AndroidJniInterface(QObject *parent = nullptr):
        QObject(parent){}
};

#endif // ANDROIDJNIINTERFACE_H
