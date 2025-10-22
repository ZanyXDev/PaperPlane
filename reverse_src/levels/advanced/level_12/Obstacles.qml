// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int firstObstacleX: obstacle1.x+obstacle1.width + firnitureSpacing*2

    property int chairEndX: obstacle2.x+obstacle2.width+3*firnitureSpacing

    property int obstaclesEndX: obstacle10.x+obstacle10.width+firnitureSpacing/3

    property alias deckGroupStartX: obstacle14.x

    property int firnitureSpacing: 100

    function inActivateVisibleObstacles(){
        obstacle10.state = 'inActive'
        obstacle11.state = 'inActive'
        obstacle12.state = 'inActive'
        obstacle13.state = 'inActive'
        obstacle14.state = 'inActive'
    }

    function activateVisibleObstacles(){
        obstacle10.state = ''
        obstacle11.state = ''
        obstacle12.state = ''
        obstacle13.state = ''
        obstacle14.state = ''
    }

    CustomCeilingLight{
        id: obstacle1
        parent: worldClassroom
        x: 500
        cableHeight: 1.6*firnitureSpacing
    }

    BigChairComponent{
        id: obstacle2
        parent: worldClassroom
        anchors.left: obstacle1.right
        anchors.leftMargin: 2.5*firnitureSpacing
    }

    VeryBigDeckComponent{
        id: obstacle10
        parent:worldClassroom
        anchors.right: worldClassroom.right
        anchors.rightMargin: 3*firnitureSpacing
    }

    SmallDeckComponent{
        id: obstacle11
        parent: worldClassroom
        anchors.left: obstacle10.left
        anchors.bottom: obstacle10.top
    }

    VeryBigDeckComponent{
        id: obstacle12
        parent: worldClassroom
        anchors.right: obstacle10.left
        anchors.rightMargin: firnitureSpacing/5
    }

    VeryBigDeckComponent{
        id: obstacle13
        parent: worldClassroom
        anchors.right: obstacle12.left
        anchors.rightMargin: firnitureSpacing/5
    }

    VeryBigDeckComponent{
        id: obstacle14
        parent: worldClassroom
        anchors.right: obstacle13.left
        anchors.rightMargin: firnitureSpacing/5
    }
}
