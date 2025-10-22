import QtQuick 1.1
import Box2D 1.0

Body {
    id: enemySaita

    property int bottomBorder: 0

    property int force: -90

    fixedRotation: true
    width: 96
    height: 90
    z:4

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
                Qt.point(9,5),
                Qt.point(41,89),
                Qt.point(95,53)
            ]

            onBeginContact: { /*forceTimer.stop(); */enemySaita.state = 'inActive' }
        },
        Polygon {
            density: 0.2
            friction: 0.8
            restitution: 0.1
            vertices: [
                Qt.point(21,38),
                Qt.point(5,81),
                Qt.point(35,77)
            ]

            onBeginContact: { /*forceTimer.stop(); */enemySaita.state = 'inActive' }
        }
    ]

    Image {
        id:saitaImage
        source: "../images/saita/saita_fliped.png"
        smooth: true
        anchors.fill: parent
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
