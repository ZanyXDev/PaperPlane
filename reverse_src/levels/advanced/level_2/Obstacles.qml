// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    function stopTimer(){
        timer.stop()
    }

    property int counter: 2
    property bool start: true

    function createEnemySaita(){
        var component = Qt.createComponent(Qt.resolvedUrl('obstacles/EnemySaita.qml'));


        if(component.status == Component.Ready){
            var object = component.createObject(worldClassroom,{"x": worldClassroom.width, "y": worldClassroom.height* (counter/5)} );
            if(!start)
                object.x -= object.width;
            else
                object.x = worldClassroom.width/2;
            object.z = 200
            object.linearVelocity = Qt.point(-150,0)
            object.bottomBorder = worldClassroom.height* (counter/5)
        }else
            console.log(component.errorString())

        if(++counter == 5){
            counter = 1;
            start = false;
        }
    }

    Timer{
        id: timer
        running: worldClassroom.running
        repeat: true
        interval: 3000
        triggeredOnStart: true

        onTriggered: {
            createEnemySaita();
        }
    }

    SmallChairComponent{
        id: obstacle1
        x: 600
        bodyMode: "static"
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle12
        x: 1800
        bodyMode: "static"
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle3
        x: 2100
        cableHeight: 80
        parent: worldClassroom
    }
}
