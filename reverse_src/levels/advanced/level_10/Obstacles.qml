// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int firstObstacleX: obstacle1.x+obstacle1.width + firnitureSpacing/2

    property alias firstChairX: obstacle4.x

    property int firstSlotX: obstacle5.x -firnitureSpacing/2

    property int secondSlotX: obstacle6.x+obstacle6.width+firnitureSpacing/3

    property int secondCeilingX: obstacle2.x + obstacle2.width+firnitureSpacing/3

    property int firnitureSpacing: 100

    property int counter: 1

    function inActivateVisibleObstacles(){
        obstacle6.state = 'inActive'
        obstacle5.state = 'inActive'
        obstacle11.state = 'inActive'
        obstacle12.state = 'inActive'
    }

    function activateVisibleObstacles(){
        obstacle6.state = 'active'
        obstacle5.state = 'active'
        obstacle11.state = 'active'
        obstacle12.state = 'active'
    }

    function cutCeilingLight(){
        scissorAnimation.x = obstacle2.x + obstacle2.width/2 - obstacle2.cableWidth
        scissorAnimation.y = worldClassroom.ceilingWallHeight+ 5

        scissorAnimation.show()
    }

    //
    // this is the scissors animation
    //
    ScissorAnimation{
        id: scissorAnimation
        parent: worldClassroom
    }

    Connections{
        target: scissorAnimation
        onFinished: obstacle2.state = 'fall'
    }

    ResizableCeilingLight{
        id: obstacle1
        x: 400
        parent: worldClassroom
        cableHeight: firnitureSpacing
        timerInterval: 150
    }

    FallingCeilingLight{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: firnitureSpacing*4.5
        parent: worldClassroom
        cableHeight: 2*firnitureSpacing
    }

    MovingCeilingLight_Small{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: firnitureSpacing*2.2
        parent: worldClassroom
    }

    BigChairComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 3*firnitureSpacing
        parent: worldClassroom
    }

    VeryBigDeckComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: firnitureSpacing*3
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle11
        anchors.left: obstacle5.left
        anchors.bottom: obstacle5.top
        parent: worldClassroom
    }

    VeryBigDeckComponent{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: 5
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle12
        anchors.left: obstacle6.left
        anchors.bottom: obstacle6.top
        parent: worldClassroom
    }

    BigChairComponent{
        id: obstacle7
        anchors.left: obstacle6.right
        anchors.leftMargin: 2.5*firnitureSpacing
        parent: worldClassroom
    }

    MovingCeilingLight_Big{
        id: obstacle8
        anchors.left: obstacle7.right
        anchors.leftMargin: firnitureSpacing*3
        parent: worldClassroom
    }

    Component.onCompleted: obstacle1.timerRunning = true
}
