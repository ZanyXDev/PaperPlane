// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Extras {
    id: specialEffectBullet
    width: 44
    height: 50

    extrasType: 2

    source: "../images/extras/stick.png"

    property double seconds: 5.0

    property double speedIncreaseProportion: 1.4

    Image{
        id: stickImage
        source: specialEffectBullet.source

        Image{
            id: windmill
            source: "../images/extras/windmill.png"
            fillMode: Image.PreserveAspectFit
            anchors.topMargin: -5
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter

            RotationAnimation on rotation{ duration:900; from: 0; to:360; loops: Animation.Infinite }
        }
    }
}
