// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {
    property int obstaclesSpacing: 100

    property int ballGroupEndX: obstacle3.x+obstacle3.width

    property int resizableLightGroupEndX: obstacle13.x+obstacle13.width

    property int firstSlotX: obstacle6.x - obstaclesSpacing*0.85

    property alias ballGroupMiddleX: obstacle1.x

    BasketBallComponent{
        id: obstacle
        parent: worldClassroom
        x: 6*obstaclesSpacing
        y: worldClassroom.height/1.5
        bRestitution: 0.97
        initialLinearVelocity: Qt.point(0,260)
    }

    BasketBallComponent{
        id: obstacle0
        parent: worldClassroom
        anchors.left: obstacle.right
        anchors.leftMargin: obstaclesSpacing
        y: worldClassroom.height/2
        bRestitution: 0.98
        initialLinearVelocity: Qt.point(0,200)
    }

    BasketBallComponent{
        id: obstacle1
        parent: worldClassroom
        anchors.left: obstacle0.right
        anchors.leftMargin: obstaclesSpacing
        y: worldClassroom.height/6
        bRestitution: 0.97
    }

    BasketBallComponent{
        id: obstacle2
        parent: worldClassroom
        anchors.left: obstacle1.right
        anchors.leftMargin: obstaclesSpacing
        y: worldClassroom.height/4.5
        bRestitution: 0.98
    }

    BasketBallComponent{
        id: obstacle3
        parent: worldClassroom
        anchors.left: obstacle2.right
        anchors.leftMargin: obstaclesSpacing
        y:worldClassroom.height/5
        bRestitution: 0.99
    }

    SmallDeckComponent{
        id: obstacle4
        parent: worldClassroom
        anchors.left: obstacle3.right
        anchors.leftMargin: 4*obstaclesSpacing
    }

    ResizableCeilingLight{
        id: obstacle5
        parent: worldClassroom
        anchors.horizontalCenter: obstacle4.horizontalCenter
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle4.height
    }

    SmallDeckComponent{
        id: obstacle6
        parent: worldClassroom
        anchors.left: obstacle4.right
        anchors.leftMargin: 1.5*obstaclesSpacing
    }

    SmallDeckComponent{
        id: obstacle7
        parent: worldClassroom
        anchors.left: obstacle6.left
        anchors.bottom: obstacle6.top
    }

    ResizableCeilingLight{
        id: obstacle8
        parent: worldClassroom
        anchors.horizontalCenter: obstacle7.horizontalCenter
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle6.height - obstacle7.height
        timerInterval: timerInterval*2.2
    }

    VeryBigDeckComponent{
        id:obstacle9
        parent: worldClassroom
        anchors.left: obstacle6.right
        anchors.leftMargin: 1.5*obstaclesSpacing
    }

    ResizableCeilingLight{
        id: obstacle10
        parent: worldClassroom
        anchors.horizontalCenter: obstacle9.horizontalCenter
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle9.height
        timerInterval: timerInterval*1.8
        cableHeight: obstaclesSpacing/3
    }

    SmallDeckComponent{
        id: obstacle11
        parent: worldClassroom
        anchors.left: obstacle9.right
        anchors.leftMargin: 1.5*obstaclesSpacing
    }

    ResizableCeilingLight{
        id: obstacle12
        parent: worldClassroom
        anchors.horizontalCenter: obstacle11.horizontalCenter
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle11.height
        timerInterval: timerInterval*1.5
    }

    ResizableCeilingLight{
        id: obstacle13
        parent: worldClassroom
        anchors.left: obstacle12.right
        anchors.leftMargin: obstaclesSpacing
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight)
        timerInterval: timerInterval
    }

    CustomCeilingLight{
        id: obstacle14
        anchors.left: obstacle13.right
        anchors.leftMargin: obstaclesSpacing*4.2
        parent: worldClassroom
        cableHeight: 2.2*obstaclesSpacing
    }

    Component.onCompleted: {
        obstacle5.timerRunning = true;
        obstacle10.timerRunning = true;
        obstacle8.timerRunning = true;
        obstacle12.timerRunning = true;
        obstacle13.timerRunning = true;
    }
}
