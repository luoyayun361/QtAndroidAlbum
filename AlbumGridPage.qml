import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2
import Qt.labs.folderlistmodel 2.11


Rectangle {
    id:photoGridRoot
    property string filePath
    property string uuidStr
    property string albumPtr
    focus: visible

    FolderListModel {
        id: folderModel
        showDirs: false
        nameFilters: ["*.png", "*.jpg", "*.jpeg", "*.gif","*.JPG","*.PNG", "*.bmp","*.BMP","*.GIF","*.gif"]
        folder: filePath + "/"
    }


    GridView{
        id:gridView
        focus: false
        clip: true
        anchors.fill: parent
        cellWidth: parent.width/3.0
        cellHeight: cellWidth
        maximumFlickVelocity:15000  //设置滑动的最大速度
        model: folderModel
        delegate: Image {
            width: gridView.cellWidth- 5
            height: width
            asynchronous: true
            cache: true
            sourceSize.width: 250
            sourceSize.height: 250
            fillMode: Image.PreserveAspectCrop
            source:folderModel.folder + fileName

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    gridView.currentIndex = index
                    console.log("gridView item clicked",gridView.currentIndex)
//                    stackView.push(Qt.resolvedUrl("qrc:/AlbumScanPage.qml"))
                    stackView.push([Qt.resolvedUrl("qrc:/AlbumScanPage.qml"),
                                    {/*"photoScanModel":folderModel,*/
                                        "path":photoGridRoot.filePath,
                                        "curIndex":gridView.currentIndex}])
                }
            }
        }
    }
}

