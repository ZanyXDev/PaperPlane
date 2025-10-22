// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle1.x+obstacle1.width+spacing*2,worldClassroom.ceilingWallHeight+spacing/8)
    property variant secondBonusPos: Qt.point(obstacle5.x+obstacle5.width+spacing/1.3,worldClassroom.height-worldClassroom.floorWallHeight-spacing/4)
    property variant thirdBonusPos: Qt.point(obstacle6.x+obstacle6.width+spacing,worldClassroom.ceilingWallHeight+spacing/6)

    ResizableCeilingLight{
        id: obstacle1
        x: 3*spacing
        cableHeight: spacing/2
        parent: worldClassroom
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle2.height
        timerInterval: 300
    }

    SmallDeckComponent{
        id: obstacle2
        anchors.horizontalCenter: obstacle1.horizontalCenter
        parent: worldClassroom
    }

    ResizableCeilingLight{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: 4*spacing
        cableHeight: spacing/2
        parent: worldClassroom
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle2.height
        timerInterval: 400
    }

    SmallDeckComponent{
        id: obstacle4
        anchors.horizontalCenter: obstacle3.horizontalCenter
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle5
        anchors.left: obstacle3.right
        anchors.leftMargin: 1.5*spacing
        parent: worldClassroom
    }

    MovingCeilingLight_Big{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: spacing*2
        parent: worldClassroom
    }

    MovingCeilingLight_Small{
        id: obstacle7
        anchors.left: obstacle6.right
        anchors.leftMargin: spacing*3
        parent: worldClassroom
    }

    Component.onCompleted: {
        obstacle1.timerRunning = true;
        obstacle3.timerRunning = true;
    }
}
