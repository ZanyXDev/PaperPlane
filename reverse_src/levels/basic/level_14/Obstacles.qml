// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int spacing: 200

    property variant firstBonusPos: Qt.point(1.75*spacing,worldClassroom.ceilingWallHeight)
    property variant secondBonusPos: Qt.point(obstacle4.x ,worldClassroom.height/2)
    property variant thirdBonusPos: Qt.point(obstacle6.x,worldClassroom.height/2)

    property variant effect1Pos: Qt.point(obstacle3.x+obstacle3.width+spacing/1.2,worldClassroom.height/4)

    function slowDownTimer(){
        obstacle1.timerRunning = 230
        obstacle2.timerRunning = 250
        obstacle3.timerRunning = 250
    }

    ResizableCeilingLight{
        id: obstacle1
        x: 4*spacing
        parent: worldClassroom
        cableHeight: spacing/1.2
    }

    ResizableCeilingLight{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: spacing*1.2
        parent: worldClassroom
        cableHeight: spacing/1.2
        timerInterval: 220
    }

    ResizableCeilingLight{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: spacing*1.2
        parent: worldClassroom
        cableHeight: spacing/1.2
        timerInterval: 220
    }

    SmallDeckComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: spacing*3
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: spacing*1.45
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: spacing*1.45
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle7
        anchors.left: obstacle6.right
        anchors.leftMargin: spacing*1.45
        parent: worldClassroom
    }

    Component.onCompleted: {
        obstacle1.timerRunning = true;
        obstacle2.timerRunning = true;
        obstacle3.timerRunning = true;
    }
}
