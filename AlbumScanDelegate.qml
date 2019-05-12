import QtQuick 2.11

Rectangle{
    id:wrapper
    property bool pinchAreaBool: true
    color:"black"

    property real initWidth : Math.min(width,height)
    property real initHeight: Math.max(width,height)
    property int initw: width
    property int inith: height

    signal itemClicked

    onWidthChanged: {
        initw = width
        inith = height
        flick.contentWidth = initw
        flick.contentHeight = inith
    }
    onHeightChanged: {
        initw = width
        inith = height
        flick.contentWidth = initw
        flick.contentHeight = inith
    }


    Flickable {
      id: flick
      anchors.fill: parent
      anchors.centerIn: parent
      contentWidth: initw
      contentHeight: inith
      z:1

      PinchArea {
          width: Math.max(flick.contentWidth, flick.width)
          height: Math.max(flick.contentHeight, flick.height)
          enabled:pinchAreaBool
          property real initialWidth
          property real initialHeight
          onPinchStarted: {
              initialWidth = flick.contentWidth
              initialHeight = flick.contentHeight
          }

          onPinchUpdated: {
              // adjust content pos due to drag
              flick.contentX += pinch.previousCenter.x - pinch.center.x
              flick.contentY += pinch.previousCenter.y - pinch.center.y

              // resize content
              flick.resizeContent((initialWidth * pinch.scale)<root.width?root.width:(initialWidth * pinch.scale),
                                  (initialHeight * pinch.scale)<root.height?root.height:(initialHeight * pinch.scale), pinch.center)
          }

          onPinchFinished: {
              // Move its content within bounds.
              flick.returnToBounds()
          }

          Image {
              id:image
              width: flick.contentWidth
              height: flick.contentHeight
              cache: true
              source: photoScan.model.folder + fileName
              anchors.centerIn: parent
              asynchronous: true
              fillMode: Image.PreserveAspectFit
              MouseArea {
                  anchors.fill: parent
                  onDoubleClicked: {
                      flick.contentWidth = initw
                      flick.contentHeight = inith
                  }
                  onClicked: {
                      wrapper.itemClicked()
                  }

              }
          }
        }
      }
}
