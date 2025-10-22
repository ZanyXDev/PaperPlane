// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int firstObstacleX: obstacle1.x+obstacle1.width + firnitureSpacing/2

    property int firstSlotX: obstacle2.x+obstacle3.width + firnitureSpacing/2

    property int secondSlotX: obstacle4.x + obstacle4.width + firnitureSpacing/2

    property int lastDeskX: obstacle5.x + obstacle5.width

    property alias movingLampX: obstacle3.x

    property int movingLampEnd: obstacle3.x+obstacle3.width+obstacles.firnitureSpacing/2

    property int firnitureSpacing: 100

    property int counter: 1

    function inActivateVisibleObstacles(){
        obstacle1.state = 'inActive'
        obstacle2.state = 'inActive'
        obstacle3.state = 'inActive'
        obstacle4.state = 'inActive'
        obstacle5.state = 'inActive'
    }

    function activateVisibleObstacles(){
        obstacle1.state = 'active'
        obstacle2.state = 'active'
        obstacle3.state = 'active'
        obstacle4.state = 'active'
        obstacle5.state = 'active'
    }

    function createEnemySaita(){
        var component = Qt.createComponent(Qt.resolvedUrl('obstacles/EnemySaita.qml'));


        if(component.status == Component.Ready){
            var object = component.createObject(worldClassroom,{"x": worldClassroom.width-obstacles.firnitureSpacing, "y": worldClassroom.height/3 } );
            object.z = 200
            object.linearVelocity = Qt.point(-150,0)
            object.bottomBorder = worldClassroom.height* (counter/5)
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
        interval: 2500
        triggeredOnStart: true

        onTriggered: {
            createEnemySaita();
        }
    }

    CustomCeilingLight{
        id: obstacle1
        x: 400
        parent: worldClassroom
        cableHeight: firnitureSpacing
    }

    SmallChairComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: 3*firnitureSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: firnitureSpacing*1.8
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 2*firnitureSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: firnitureSpacing/2
        parent: worldClassroom
    }
}
