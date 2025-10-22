// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {
    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle1.x-1.3*spacing,worldClassroom.ceilingWallHeight)
    property variant secondBonusPos: Qt.point(obstacle7.x + obstacle7.width+spacing/1.3,worldClassroom.height-worldClassroom.ceilingWallHeight-spacing/4.1)
    property variant thirdBonusPos: Qt.point(obstacle7.x+obstacle7.width+4*spacing,worldClassroom.height/2)

    property int counter: 1

    Timer{
        id: timer
        running: worldClassroom.running
        repeat: true
        interval: 5000
        triggeredOnStart: true

        onTriggered: {
            createBasketBall();
        }
    }

    function createBasketBall(){
        var component = Qt.createComponent(Qt.resolvedUrl('obstacles/BasketBallComponent.qml'));


        if(component.status == Component.Ready){
            var object = component.createObject(worldClassroom,{"x": worldClassroom.width-spacing/2, "y": worldClassroom.height/3, "initialLinearVelocity": Qt.point(-160,150),"bRestitution": 0.98} );
            object.z = 200
        }else
            console.log(component.errorString())

        if(++counter == 5){
            counter = 1;
        }
    }

    ResizableCeilingLight{
        id: obstacle1
        x: 3*spacing
        cableHeight: spacing/2
        parent: worldClassroom
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle2.height
        timerInterval: 330
    }

    BigDeckComponent{
        id: obstacle2
        anchors.horizontalCenter: obstacle1.horizontalCenter
        parent: worldClassroom
    }

    ResizableCeilingLight{
        id: obstacle3
        anchors.left: obstacle1.right
        anchors.leftMargin: spacing
        cableHeight: spacing/1.4
        parent: worldClassroom
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle4.height
        timerInterval: 350
    }

    SmallDeckComponent{
        id: obstacle4
        anchors.horizontalCenter: obstacle3.horizontalCenter
        parent: worldClassroom
    }

    ResizableCeilingLight{
        id: obstacle5
        anchors.left: obstacle3.right
        anchors.leftMargin: spacing
        cableHeight: spacing/3.4
        parent: worldClassroom
        bottomBorderLimit: worldClassroom.height - (2*worldClassroom.floorWallHeight) - obstacle6.height - obstacle7.height
        timerInterval: 450
    }

    BigDeckComponent{
        id: obstacle6
        anchors.horizontalCenter: obstacle5.horizontalCenter
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle7
        anchors.horizontalCenter: obstacle5.horizontalCenter
        anchors.bottom: obstacle6.top
        parent: worldClassroom
    }

    BeanComponent{
        id: obstacle8
        anchors.left: obstacle5.right
        anchors.leftMargin: 2.2*spacing
        parent: worldClassroom
    }

    BeanComponent{
        id: obstacle9
        anchors.left: obstacle8.right
        anchors.leftMargin: 2*spacing
        parent: worldClassroom
    }

    MovingCeilingLight_Small{
        id: obstacle10
        anchors.left: obstacle9.right
        anchors.leftMargin: 1.5*spacing
        parent:worldClassroom
    }

    BeanComponent{
        id: obstacle11
        anchors.left: obstacle10.right
        anchors.leftMargin: spacing
        parent: worldClassroom
    }

    Component.onCompleted: {
        obstacle1.timerRunning = true
        obstacle3.timerRunning = true
        obstacle5.timerRunning = true
    }

}
