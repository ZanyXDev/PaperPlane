// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image {
    id: busyAnimation
    width: 48
    height: 48
    rotation: 0
    fillMode: Image.PreserveAspectFit

    property bool animationRunning: false

    source: "assets/images/animations/loading.png"

    // Animate a rotation
    transformOrigin: Item.Center
    NumberAnimation on rotation {
        from: 0; to: 360
        duration: 600
        loops: Animation.Infinite
        running: animationRunning
    }
}
