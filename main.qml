import QtQuick 2.9
import QtQuick.Window 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    id:root
    visible: true
    width: 640
    height: 480
    title: qsTr("Album")

    Shortcut{
        sequences: ["Esc","Back"]
        onActivated: {
            console.log("--->>Shortcur<<---")
            if(stackView.depth > 1){
                stackView.pop()
            }
            else{
                root.visible = false
                Qt.quit()
            }

        }
    }

    Connections{
        target: dataManager
        onAddDirModelData:{
            console.log("name = ",name,"url = " ,url,
                        "num = ",num,"firstPath = ",firstPath)
            addDirectoryData(name,url,num,firstPath)
        }
    }

    StackView{
        id:stackView
        anchors.fill: parent
        initialItem: AlbumListPage{}
    }

    ListModel{
        id:albumListModel
    }

    function addDirectoryData(name,url,num,firstPath){
        albumListModel.append({"directoryName":name,"directoryUrl":url,"PhotoNum":num,"fistImagePath":firstPath})
    }
}
