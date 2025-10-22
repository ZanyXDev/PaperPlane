// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int firstSlotX: obstacle1.x+obstacle1.width + firnitureSpacing/2

    property int secondSlotX: obstacle2.x+obstacle2.width + firnitureSpacing/2

    property alias movingLampX: obstacle3.x

    property int movingLampEnd: obstacle3.x+obstacle3.width+obstacles.firnitureSpacing/2

    property int firnitureSpacing: 100

    property int counter: 1

    function cutCeilingLight(){
        scissorAnimation.x = obstacle2.x + obstacle2.width/2 - obstacle2.cableWidth
        scissorAnimation.y = worldClassroom.ceilingWallHeight+ 5

        scissorAnimation.show()
    }

    function createBasketBall(){
        var component = Qt.createComponent(Qt.resolvedUrl('obstacles/BasketBallComponent.qml'));


        if(component.status == Component.Ready){
            var object = component.createObject(worldClassroom,{"x": worldClassroom.width-obstacles.firnitureSpacing, "y": worldClassroom.height/3, "initialLinearVelocity": Qt.point(-150,70) } );
            object.z = 200
        }else
            console.log(component.errorString())

        if(++counter == 5){
            counter = 1;
        }
    }

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

    CustomCeilingLight{
        id: obstacle1
        x: 400
        parent: worldClassroom
        cableHeight: 1.5*firnitureSpacing
    }

    FallingCeilingLight{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: firnitureSpacing * 4.5
        parent: worldClassroom
        cableHeight: 1.5*firnitureSpacing
    }

    MovingCeilingLight_Medium{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: firnitureSpacing*3
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 4*firnitureSpacing
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: 6*firnitureSpacing
        parent: worldClassroom
    }

    BeanComponent{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: 4.5*firnitureSpacing
        parent: worldClassroom
    }
}
