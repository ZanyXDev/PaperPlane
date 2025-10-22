// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle1.x-spacing,worldClassroom.height-worldClassroom.ceilingWallHeight-spacing/4.3)
    property variant secondBonusPos: Qt.point(obstacle2.x - spacing,worldClassroom.height-worldClassroom.ceilingWallHeight-spacing/4.3)
    property variant thirdBonusPos: Qt.point(obstacle3.x-spacing,worldClassroom.height-worldClassroom.ceilingWallHeight-spacing/4.3)

    DeskComponent{
        id: obstacle1
        x: spacing*6
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: spacing*2
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: spacing*2
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 1.7*spacing
        parent: worldClassroom
        cableHeight: spacing
    }
}
