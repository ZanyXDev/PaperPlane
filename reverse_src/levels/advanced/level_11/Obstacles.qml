// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int firstDeskX: obstacle2.x+obstacle2.width

    property alias secondChairX: obstacle3.x

    property int forthDeskX: obstacle8.x+obstacle8.width

    property alias fifthChairX: obstacle9.x

    property alias lastObstacleX: obstacle20.x

    property int firnitureSpacing: 50

    SmallChairComponent{
        id: obstacle1
        x: 700
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: firnitureSpacing
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: 4*firnitureSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: firnitureSpacing
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: firnitureSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: firnitureSpacing
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle7
        anchors.left: obstacle6.right
        anchors.leftMargin: firnitureSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle8
        anchors.left: obstacle7.right
        anchors.leftMargin: firnitureSpacing
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle9
        anchors.left: obstacle8.right
        anchors.leftMargin: 4*firnitureSpacing
        parent: worldClassroom
    }

    MovingCeilingLight_Small{
        id: obstacle11
        anchors.right: obstacle1.left
        anchors.rightMargin: firnitureSpacing * 3
        parent: worldClassroom
    }

    MovingCeilingLight_Small{
        id: obstacle12
        anchors.left: obstacle6.left
        anchors.leftMargin: firnitureSpacing
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle13
        anchors.left: obstacle9.right
        anchors.leftMargin: 4*firnitureSpacing
        cableHeight: firnitureSpacing*3
        parent: worldClassroom
    }

    VeryBigDeckComponent{
        id: obstacle10
        anchors.left: obstacle13.right
        anchors.leftMargin: 4*firnitureSpacing
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle20
        anchors.left: obstacle10.left
        anchors.bottom: obstacle10.top
        parent: worldClassroom
    }
}
