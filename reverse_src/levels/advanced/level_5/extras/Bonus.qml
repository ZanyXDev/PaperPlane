// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Box2D 1.0

Extras{
    id: bodyItem
    width: 47
    height: 45

    source: imagepath

    property bool active: true

    extrasType: 11

    property string imagepath: "../images/extras/apple.png"
    property string imagepathsqueezed: "../images/extras/apple_squeezed.png"

    Image{
        id: image
        anchors.fill: parent
        source: bodyItem.source

        SequentialAnimation on source{
            running: true
            loops: Animation.Infinite
            PropertyAnimation{ from: imagepath; to: imagepathsqueezed }
            PropertyAnimation{ from: imagepathsqueezed; to: imagepath }
        }
    }
}
