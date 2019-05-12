import QtQuick 2.11
import Qt.labs.folderlistmodel 2.11

Rectangle{
    id:root
//    property alias photoScanModel: photoScan.model
    property int curIndex: 0
    property string path
    width: parent.width
    height: parent.height


    ListView{
        id:photoScan
        anchors.fill: parent
        model: scanModel
        cacheBuffer: 5
        clip: true
        z:1
        maximumFlickVelocity:7000  //设置滑动的最大速度
        highlightRangeMode: ListView.NoHighlightRange
        orientation: ListView.Horizontal
        snapMode: ListView.SnapOneItem
        currentIndex:curIndex
        delegate:AlbumScanDelegate{
            width: photoScan.width
            height: photoScan.height
        }
    }

    FolderListModel {
        id:scanModel
        showDirs: false
        nameFilters: ["*.png", "*.jpg", "*.jpeg", "*.gif","*.JPG","*.PNG", "*.bmp","*.BMP","*.GIF","*.gif"]
        folder: path + "/"
    }

    Component.onCompleted: {
        console.log("path = ",path,width,height,photoScan.width)
    }
}

