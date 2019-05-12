import QtQuick 2.0


Rectangle{
    id:wapper
    signal itemClicked
    height: 99
    width:parent.width
    color:ma.pressed ? "#d5d8db" : "white"

    Image{
        id:img
        width: 70
        height: width
        source: "file://" + fistImagePath
        anchors.left: parent.left
        anchors.leftMargin: 18
        anchors.verticalCenter: parent.verticalCenter
        fillMode: Image.PreserveAspectCrop
        sourceSize.width: width
        sourceSize.height: width
    }

    Text {
        id: txt
        text:directoryName
        font.pixelSize: 18
        anchors.left: img.right
        anchors.leftMargin: 11
        anchors.top: parent.top
        anchors.topMargin: 28
    }
    Text {
        id: num
        text:PhotoNum
        font.pixelSize: 12
        anchors.bottom: img.bottom
        anchors.bottomMargin: 10
        anchors.left: img.right
        anchors.leftMargin: 11
    }

    //            Image{
    //                anchors.verticalCenter: parent.verticalCenter
    //                anchors.right: parent.right
    //                anchors.rightMargin: 23/375.0 * photoDirectoryRoot.width
    //                source: commonParameter.getSkinPath() + "btn_spread_normal.png"
    //                height: 15/99 * parent.height
    //            }

    Rectangle{
        width: parent.width
        height: 1
        color: "#d0d0d0"
        opacity: 0.6
        y:parent.height - 1
    }

    MouseArea{
        id:ma
        anchors.fill: parent
        onClicked: {
            wapper.ListView.view.currentIndex = index
            wapper.itemClicked()
        }
    }
}

