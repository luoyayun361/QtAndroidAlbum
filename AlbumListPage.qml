import QtQuick 2.0
import QtQuick.Controls 2.2

ListView{
    id:listView
    focus:false
    clip: true
//    anchors.fill: parent
    model:albumListModel
    maximumFlickVelocity:15000  //设置滑动的最大速度
    delegate: AlbumListDelegate{
        id:directoryDelegate
        onItemClicked: {
            var curIndex = listView.currentIndex
            console.log("currentIndex = " , curIndex,"directoryUrl = ",directoryUrl)
//            stackView.push(Qt.resolvedUrl("qrc:/AlbumGridPage.qml"))
            stackView.push([Qt.resolvedUrl("qrc:/AlbumGridPage.qml"),
                               {focus:true,
                                   "filePath":"file://" + directoryUrl}])

        }
    }

}

