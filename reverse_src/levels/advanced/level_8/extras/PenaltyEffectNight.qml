// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Extras {
    id: penaltyEffectNight
    width: 36
    height: 61

    property string imagepath: "../images/extras/bulb.png"
    property string imagepathsqueezed: "../images/extras/bulb_squeezed.png"

    property double seconds: 5.0

    extrasType: 21

    Image{
        id: image
        anchors.fill: parent
        source: penaltyEffectNight.source
        fillMode: Image.PreserveAspectFit

        SequentialAnimation on source{
            running: true
            loops: Animation.Infinite
            PropertyAnimation{ from: imagepath; to: imagepathsqueezed }
            PropertyAnimation{ from: imagepathsqueezed; to: imagepath }
        }

        Image{
            id:lightImage
            source: "../images/extras/light.png"
            x:11
            y:9
            z: penaltyEffectNight.z-1

            SequentialAnimation on opacity{
                running: true
                loops: Animation.Infinite
                NumberAnimation{ from: 80; to: 20 }
                NumberAnimation{ from: 20; to: 80 }
            }
        }
    }
}
