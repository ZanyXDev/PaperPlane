// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property alias lampStartX: obstacle1.x

    property int lampEndX: obstacle6.x + obstacle6.width

    property int obstaclesEndX: obstacle11.x + obstacle11.width

    property int lampSpacing: 150

    property int lampTimerInterval: 100

    property int fallingLampEndX: obstacle7.x + obstacle7.width

    property double timerIncreaseValue: 0.1

    function startTimer(){
        obstacle1.timerRunning = true;
        obstacle2.timerRunning = true;
        obstacle3.timerRunning = true;
        obstacle4.timerRunning = true;
        obstacle5.timerRunning = true;
        obstacle6.timerRunning = true;
    }

    function cutCeilingLight(){
        scissorAnimation.x = obstacle7.x + obstacle7.width/2 - obstacle7.cableWidth
        scissorAnimation.y = worldClassroom.ceilingWallHeight+ 5

        scissorAnimation.show()
    }

    function slowDownTimer(){
        lampTimerInterval = lampTimerInterval * 5
    }

    Timer{
        id: singleShotTimer
        running: true
        interval: 4000

        onTriggered: startTimer()
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
        onFinished: obstacle7.state = 'fall'
    }

    ResizableCeilingLight{
        id: obstacle1
        x: 800
        parent: worldClassroom
        timerInterval: lampTimerInterval
    }

    ResizableCeilingLight{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: lampSpacing
        parent: worldClassroom
        timerInterval: lampTimerInterval * (1+timerIncreaseValue)
    }

    ResizableCeilingLight{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: lampSpacing
        parent: worldClassroom
        timerInterval: lampTimerInterval * (1+(1.5*timerIncreaseValue))
    }

    ResizableCeilingLight{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: lampSpacing
        parent: worldClassroom
        timerInterval: lampTimerInterval * (1+(2*timerIncreaseValue))
    }

    ResizableCeilingLight{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: lampSpacing
        parent: worldClassroom
        timerInterval: lampTimerInterval * (1+(2.5*timerIncreaseValue))
    }

    ResizableCeilingLight{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: lampSpacing
        parent: worldClassroom
        timerInterval: lampTimerInterval * (1+(3*timerIncreaseValue))
//        cableHeight: worldClassroom.height/4.5
    }

    FallingCeilingLight{
        id: obstacle7
        parent: worldClassroom
        anchors.left: obstacle6.right
        anchors.leftMargin: 4*lampSpacing
        cableHeight: 1.2*lampSpacing
    }

    VeryBigDeckComponent{
        id: obstacle11
        parent: worldClassroom
        anchors.left: obstacle7.right
        anchors.leftMargin: 1.7*lampSpacing
    }

    SmallDeckComponent{
        id: obstacle12
        parent: worldClassroom
        anchors.bottom: obstacle11.top
        anchors.left: obstacle11.left
        bodyMode: "static"
    }
}
