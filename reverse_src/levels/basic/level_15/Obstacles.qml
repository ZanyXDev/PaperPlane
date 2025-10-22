// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {
    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle2.x+obstacle2.width+spacing/2,worldClassroom.height-worldClassroom.floorWallHeight-spacing/3.8)
    property variant secondBonusPos: Qt.point(obstacle4.x +obstacle4.width/3 ,worldClassroom.ceilingWallHeight+spacing/8)
    property variant thirdBonusPos: Qt.point(obstacle10.x+obstacle10.width+spacing/4,worldClassroom.height-worldClassroom.floorWallHeight-spacing/3.7)

    property variant effect1Pos: Qt.point(obstacle1.x-spacing/1.8,worldClassroom.height-worldClassroom.floorWallHeight-spacing/3.5)
    property variant effect2Pos: Qt.point(obstacle7.x-spacing/1.8,worldClassroom.height-worldClassroom.floorWallHeight-spacing/3.5)

    function inActivateVisibleObstacles(){
        obstacle1.state = 'inActive'
        obstacle2.state = 'inActive'
        obstacle7.state = 'inActive'
        obstacle8.state = 'inActive'
        obstacle9.state = 'inActive'
        obstacle10.state = 'inActive'
    }

    function activateVisibleObstacles(){
        obstacle1.state = 'active'
        obstacle2.state = 'active'
        obstacle7.state = 'active'
        obstacle8.state = 'active'
        obstacle9.state = 'active'
        obstacle10.state = 'active'
    }

    SmallChairComponent{
        id: obstacle1
        x: 4*spacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: spacing/3
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: spacing*1.5
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: spacing/3
        parent: worldClassroom
    }

    MovingCeilingLight_Medium{
        id: obstacle5
        anchors.left: obstacle2.right
        anchors.leftMargin: spacing/2
        parent: worldClassroom
    }

    MovingCeilingLight_Medium{
        id: obstacle6
        anchors.left: obstacle4.right
        anchors.leftMargin: spacing*1.2
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle7
        anchors.left: obstacle6.right
        anchors.leftMargin: spacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle8
        anchors.left: obstacle7.right
        anchors.leftMargin: spacing/4
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle9
        anchors.left: obstacle8.right
        anchors.leftMargin: spacing/2
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle10
        anchors.left: obstacle9.right
        anchors.leftMargin: spacing/4
        parent: worldClassroom
    }

    MovingCeilingLight_Medium{
        id: obstacle11
        anchors.left: obstacle9.right
        anchors.leftMargin: spacing/2
        parent: worldClassroom
    }
}
