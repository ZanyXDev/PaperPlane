// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int furnitureSpacing: 100

    property int movingObstacleStartX: obstacle1.x

    property alias beanX: obstacle3.x

    property alias deskX: obstacle8.x

    property int deskEndX: obstacle8.x+obstacle8.width

    property int obstaclesEndX: obstacle14.x+obstacle14.width

    function inActivateVisibleObstacles(){
        obstacle8.state = 'inActive'
    }

    function activateVisibleObstacles(){
        obstacle8.state = ''
    }

    MovingCeilingLight_Big{
        id: obstacle1
        x: 550
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: furnitureSpacing*2
        parent: worldClassroom
        cableHeight: 40
    }

    BeanComponent{
        id: obstacle3
        anchors.left: obstacle2.left
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle4
        anchors.left: obstacle2.right
        anchors.leftMargin: 3*furnitureSpacing
        parent: worldClassroom
        cableHeight: 40
    }

    BigChairComponent{
        id: obstacle5
        anchors.horizontalCenter: obstacle4.horizontalCenter
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle6
        anchors.left: obstacle4.right
        anchors.leftMargin: 1.5*furnitureSpacing
        parent: worldClassroom
        cableHeight: 40
    }

    BigChairComponent{
        id: obstacle7
        anchors.horizontalCenter: obstacle6.horizontalCenter
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle8
        anchors.left: obstacle6.right
        anchors.leftMargin: 3.5*furnitureSpacing
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle9
        anchors.left: obstacle8.right
        anchors.leftMargin: 4*furnitureSpacing
        parent: worldClassroom
        cableHeight: 40
    }

    BigChairComponent{
        id: obstacle10
        anchors.horizontalCenter: obstacle9.horizontalCenter
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle11
        anchors.left: obstacle9.right
        anchors.leftMargin: 1.5*furnitureSpacing
        parent: worldClassroom
        cableHeight: 40
    }

    BigChairComponent{
        id: obstacle12
        anchors.horizontalCenter: obstacle11.horizontalCenter
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle13
        anchors.left: obstacle11.right
        anchors.leftMargin: 1.5*furnitureSpacing
        parent: worldClassroom
        cableHeight: 40
    }

    BigChairComponent{
        id: obstacle14
        anchors.horizontalCenter: obstacle13.horizontalCenter
        parent: worldClassroom
    }
}
