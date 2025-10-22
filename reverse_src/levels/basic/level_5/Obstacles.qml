// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle1.x-spacing/1.6,worldClassroom.ceilingWallHeight+spacing/4)
    property variant secondBonusPos: Qt.point(obstacle3.x+obstacle3.width+spacing/1.5,worldClassroom.ceilingWallHeight+spacing/4)
    property variant thirdBonusPos: Qt.point(obstacle5.x-spacing/1.5,worldClassroom.height-worldClassroom.floorWallHeight-spacing/3)

    MovingCeilingLight_Medium{
        id: obstacle1
        x: spacing*2.5
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: spacing
        parent: worldClassroom
    }

    MovingCeilingLight_Medium{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: spacing*1.5
        parent: worldClassroom
    }

    MovingCeilingLight_Medium{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 3*spacing
        parent: worldClassroom
    }

    ComboDeskSmallDeckComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: 2.5*spacing
        parent: worldClassroom
    }
}
