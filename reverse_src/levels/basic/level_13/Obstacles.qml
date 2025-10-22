// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {
    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle1.x-spacing,worldClassroom.height/1.6)
    property variant secondBonusPos: Qt.point(obstacle4.x + obstacle4.width,worldClassroom.height-worldClassroom.ceilingWallHeight-spacing/4.1)
    property variant thirdBonusPos: Qt.point(obstacle4.x+obstacle4.width+4*spacing,worldClassroom.height/2)

    property int counter: 1

    Timer{
        id: timer
        running: worldClassroom.running
        repeat: true
        interval: 4500
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

    BigDeckComponent{
        id: obstacle1
        x: 5.5*spacing
        parent: worldClassroom
    }

    SmallDeckComponent{
        id: obstacle2
        anchors.left: obstacle1.left
        anchors.bottom: obstacle1.top
        parent:worldClassroom
    }

    BeanComponent{
        id: obstacle3
        anchors.horizontalCenter: obstacle2.horizontalCenter
        anchors.bottom: obstacle2.top
        parent: worldClassroom
    }

    MovingCeilingLight_Big{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: spacing*2
        parent: worldClassroom
    }
}
