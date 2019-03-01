#ifndef ALBUMINFO_H
#define ALBUMINFO_H

#include <QString>

class AlbumInfo{

public:
    void setAlbumName(const QString &name){
        m_strName = name;
    }
    QString getAlbumName(){
        return m_strName;
    }

    void setFirstImagePath(const QString &path){
        m_strFirstImagePath = path;
    }
    QString getFirstImagePath(){
        return m_strFirstImagePath;
    }

    void setAlbumPath(const QString &path){
        m_strAlbumPath = path;
    }
    QString getAlbumPath(){
        return m_strAlbumPath;
    }
    void setPhotoNum(int num){
        m_nSize = num;
    }
    int getPhotoNum(){
        return m_nSize;
    }

private:
    QString m_strName;
    QString m_strFirstImagePath;
    QString m_strAlbumPath;
    int m_nSize;
};

#endif // ALBUMINFO_H
