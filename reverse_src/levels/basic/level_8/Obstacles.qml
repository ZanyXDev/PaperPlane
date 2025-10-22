// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {
    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle3.x+obstacle3.width+spacing/1.5,worldClassroom.height/2)
    property variant secondBonusPos: Qt.point(obstacle7.x-spacing*1.2,worldClassroom.height-worldClassroom.floorWallHeight-spacing/4)
    property variant thirdBonusPos: Qt.point(obstacle7.x+obstacle7.width+spacing*1.2,worldClassroom.height-worldClassroom.floorWallHeight-spacing/3)

    VeryBigDeckComponent{
        id: obstacle1
        x: 2.5*spacing
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle2
        anchors.left: obstacle1.left
        anchors.bottom: obstacle1.top
        parent: worldClassroom
    }

    VeryBigDeckComponent{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: spacing
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle4
        anchors.left: obstacle3.left
        anchors.bottom: obstacle3.top
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle5
        anchors.left: obstacle4.left
        anchors.bottom: obstacle4.top
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle6
        anchors.left: obstacle4.right
        anchors.leftMargin: spacing*2.2
        parent: worldClassroom
        cableHeight: spacing
    }

    BigChairComponent{
        id: obstacle7
        anchors.left: obstacle6.right
        anchors.leftMargin: spacing*2.2
        parent:worldClassroom
    }

    VeryBigDeckComponent{
        id: obstacle8
        anchors.left: obstacle7.right
        anchors.leftMargin: spacing*3
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle9
        anchors.left: obstacle8.left
        anchors.bottom: obstacle8.top
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle10
        anchors.left: obstacle8.left
        anchors.bottom: obstacle9.top
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle11
        anchors.left: obstacle10.right
        anchors.leftMargin: 2.4*spacing
        cableHeight: spacing
        parent: worldClassroom
    }

}
