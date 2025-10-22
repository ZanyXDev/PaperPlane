// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Extras {
    id: specialEffectScissor
    width: 44
    height: 50

    extrasType: 5

    source: "../images/extras/scissor1.png"

    property int indexTarget: -1

    Image{
        id: stickImage
        source: specialEffectScissor.source
        anchors.fill: specialEffectScissor

//        SequentialAnimation on x{
//            running: true
//            loops: Animation.Infinite
//            PropertyAnimation{ from: imagepath; to: imagepathsqueezed }
//            PropertyAnimation{ from: imagepathsqueezed; to: imagepath }
//        }
    }
}
