import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Album")

    Connections{
        target: dataManager
        onAddDirModelData:{
            console.log("name = ",name,"url = " ,url,
                        "num = ",num,"firstPath = ",firstPath)
        }
    }
}
