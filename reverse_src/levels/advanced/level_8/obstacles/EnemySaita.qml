import QtQuick 1.1
import Box2D 1.0

Body {
    id: enemySaita

    property int bottomBorder: worldClassroom.height - worldClassroom.floorWallHeight - height - 1

    property int force: -40

    fixedRotation: true
    width: 64
    height: 60
    z:4
    parent: worldClassroom

    onYChanged: { if(y > bottomBorder && linearVelocity.y > 0) { applyImpulse(); enemySaita.rotateSaita() } }

    function rotateSaita(){
        enemySaita.rotation = 10

        rotateTimer.restart()
    }

    function applyImpulse(){
        enemySaita.applyLinearImpulse(Qt.point(0,force),Qt.point(enemySaita.x + enemySaita.width/2,enemySaita.y+enemySaita.height/2)); enemySaita.rotateSaita()
    }

    Timer{
        id: destroyTimer
        running: false
        interval: 800

        onTriggered: { enemySaita.destroy() }
    }

    Timer{
        id: rotateTimer
        interval: 600
        running: false
        onTriggered: enemySaita.rotation = 0

    }

    fixtures: [
        Polygon {
            density: 0.2
            friction: 0.8
            restitution: 0.1
            vertices: [
                Qt.point(6,3),
                Qt.point(27,59),
                Qt.point(63,35)
            ]

            onBeginContact: { /*forceTimer.stop(); */enemySaita.state = 'inActive' }
        },
        Polygon {
            density: 0.2
            friction: 0.8
            restitution: 0.1
            vertices: [
                Qt.point(14,25),
                Qt.point(3,54),
                Qt.point(23,51)
            ]

            onBeginContact: { /*forceTimer.stop(); */enemySaita.state = 'inActive' }
        }
    ]

    Image {
        id:saitaImage
        source: "../images/saita/saita_fliped.png"
        smooth: true
        z:200
    }

    states:[
        State{
            name: 'inActive'

            StateChangeScript{ name: "destroyScript"; script: destroyTimer.start() }
            PropertyChanges{ target: enemySaita; active: false; opacity: 0.0 }
        }
    ]

    transitions: [
        Transition {
            to: "inActive"

            NumberAnimation{ duration: 800; property: "opacity" }
        }
    ]
}
