// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle2.x - spacing,worldClassroom.height/1.5)
    property variant secondBonusPos: Qt.point(obstacle3.x+obstacle3.width + spacing/4,worldClassroom.height/3.5)
    property variant thirdBonusPos: Qt.point(obstacle6.x-(spacing*1.6),worldClassroom.height-worldClassroom.floorWallHeight-spacing/4)

    VeryBigDeckComponent{
        id: obstacle1
        x: 2.5*spacing
        parent: worldClassroom
    }

    CeilingLightBig{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: 2*spacing
        parent: worldClassroom
    }

    VeryBigDeckComponent{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: 2*spacing
        parent: worldClassroom
    }

    CeilingLightBig{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 2*spacing
        parent: worldClassroom
    }

    BigChairComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: 2*spacing
        parent: worldClassroom
    }

    BigChairComponent{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: 3*spacing
        parent: worldClassroom
    }
}
