// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Extras {
    id: specialEffectBullet
    width: 44
    height: 44

    extrasType: 6

    source: "../images/extras/parachute-icon.png"

    seconds: 5.0

    property double speedIncreaseProportion: 0.66667

    Image{
        id: windmill
        source: "../images/extras/parachute-icon.png"
        anchors.fill: parent

        SequentialAnimation on scale{
            running: true
            loops: Animation.Infinite
            NumberAnimation{ from: 1.0; to: 1.1}
            NumberAnimation{ from: 1.1; to: 1.1 }
        }
    }
}
