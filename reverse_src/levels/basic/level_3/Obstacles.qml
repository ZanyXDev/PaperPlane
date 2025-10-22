// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int spacing: 200

    CeilingLightMedium{
        id: obstacle1
        x: 4*spacing
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: 4*spacing
        parent: worldClassroom
    }

    CeilingLightMedium{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: 4*spacing
        parent: worldClassroom
    }

    CeilingLightMedium{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: spacing
        parent: worldClassroom
    }
}
