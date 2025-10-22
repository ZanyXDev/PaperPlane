// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle2.x+obstacle2.width,worldClassroom.height/1.8)
    property variant secondBonusPos: Qt.point(obstacle5.x+obstacle5.width+spacing/2,worldClassroom.ceilingWallHeight)
    property variant thirdBonusPos: Qt.point(obstacle11.x+obstacle11.width+spacing/1.2,worldClassroom.height-worldClassroom.floorWallHeight-spacing/4)

    SmallDeckComponent{
        id: obstacle1
        x: spacing*2
        parent: worldClassroom
    }

    BigDeckComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: spacing/2
        parent: worldClassroom
    }

    MovingCeilingLight_Big{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: spacing
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle4
        anchors.horizontalCenter: obstacle3.horizontalCenter
        parent: worldClassroom
    }

    BigChairComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: spacing*1.5
        parent: worldClassroom
    }

    MovingCeilingLight_Big{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: spacing*2.5
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle7
        anchors.left: obstacle6.right
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle8
        anchors.left: obstacle7.right
        anchors.leftMargin: spacing/2
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle9
        anchors.left: obstacle8.right
        anchors.leftMargin: spacing/2
        parent: worldClassroom
    }

    MovingCeilingLight_Big{
        id: obstacle10
        anchors.left: obstacle8.right
        parent: worldClassroom
    }

    BigChairComponent{
        id: obstacle11
        anchors.left: obstacle10.right
        anchors.leftMargin: spacing
        parent: worldClassroom
    }

    Component.onCompleted: {
        obstacle6.squeekTimer.running = false
        obstacle10.squeekTimer.running = false
    }
}
