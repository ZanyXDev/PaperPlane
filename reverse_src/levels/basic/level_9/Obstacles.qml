// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {
    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle2.x-spacing/2,worldClassroom.height-worldClassroom.floorWallHeight-spacing/4)
    property variant secondBonusPos: Qt.point(obstacle5.x,worldClassroom.ceilingWallHeight+spacing/5)
    property variant thirdBonusPos: Qt.point(obstacle8.x-spacing/2,worldClassroom.height/2)

    BasketBallComponent{
        id: obstacle1
        x: spacing*3
        y:worldClassroom.ceilingWallHeight+spacing/4
        parent: worldClassroom
        bRestitution: 0.99
    }

    BasketBallComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: spacing/2
        y:worldClassroom.ceilingWallHeight+spacing/4
        parent: worldClassroom
        bRestitution: 0.99
    }

    MovingCeilingLight_Big{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: spacing
        parent: worldClassroom
    }

    BasketBallComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: spacing*2
        y:worldClassroom.ceilingWallHeight+spacing/2
        parent: worldClassroom
        bRestitution: 0.99
    }

    BasketBallComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: spacing/2
        y:worldClassroom.ceilingWallHeight+spacing/2
        parent: worldClassroom
        bRestitution: 0.99
    }

    CustomCeilingLight{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: spacing*1.5
        parent: worldClassroom
        cableHeight: spacing/1.3
    }

    BasketBallComponent{
        id: obstacle7
        anchors.left: obstacle6.right
        anchors.leftMargin: spacing*3
        y:worldClassroom.ceilingWallHeight+spacing/3
        parent: worldClassroom
        bRestitution: 0.99
    }

    BasketBallComponent{
        id: obstacle8
        anchors.left: obstacle7.right
        anchors.leftMargin: spacing
        y:worldClassroom.ceilingWallHeight+spacing/1.9
        parent: worldClassroom
        bRestitution: 0.992
    }
}
