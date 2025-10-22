// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Box2D 1.0
import "startupengine.js" as StartupEngine

Item {
    id: startupAnimationScreen
    width: 854
    height: 480

    property bool timerRunning: false

    property real shadowImageOpacity: 0

    Image{
        id: saitaTextImage
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.horizontalCenter: parent.horizontalCenter
        width: 304
        fillMode: Image.PreserveAspectFit
        z: 2
        source: "assets/images/saita_text.png"
    }

    Image{
        id: atSchoolTextImage
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 42
//        anchors.horizontalCenterOffset: -13
        anchors.horizontalCenter: parent.horizontalCenter
        width: 381
        fillMode: Image.PreserveAspectFit
        z: 2
        source: "assets/images/at_school_text.png"
    }

    Timer{
        id: onceRunTimer
        running: false
        interval: 2000

        onTriggered: timerRunning = true
    }

    Image{
        anchors.fill: parent
        source:"assets/images/background/startup_bcakground.png"
    }

    Timer{
        id: saitaGeneratorTimer
        running: timerRunning
        interval: 7000
        repeat: true
        triggeredOnStart: true

        onTriggered: {
            StartupEngine.clearObjects();

            startupAnimationScreen.state = ''

            StartupEngine.generateSaita();
        }
    }

    Timer{
        id: speedCheckTimer
        interval: 200
        repeat: true
        running: saitaGeneratorTimer.running

        onTriggered: StartupEngine.checkSpeedLost()
    }

    World{
        id: startupWorld
        z:1

        anchors.fill: parent

        gravity:Qt.point(0,-7);

        Wall{
            id: ground
            height: 31
            width: parent.width
            anchors.bottom: parent.bottom
        }

        Wall{
            id: ceiling
            height: 31
            width: parent.width
            anchors.top: parent.top
        }
    }

    Component{
        id: saitaComponent

        Body {
            id: saita
            fixedRotation: true
            width: 64
            height: 60
            z:4

            Timer{
                id: forceTimer
                interval: 1150
                repeat: true
                running: true

                onTriggered: { saita.state = 'ascend'; saita.applyLinearImpulse(Qt.point(0,-120),Qt.point(saita.x + saita.width/2,saita.y+saita.height/2))}
            }

            // this is a timer used to control the animation of the saita while ascending
            Timer{
                id: timerSaita
                interval: 900
                running: false
                // when triggered just resume the state of the saita to the default state
                onTriggered: {  saita.state = 'default'  }
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
                }
            ]

            Image {
                id:saitaImage
                source: "assets/images/saita/saita.png"
                smooth: true
                z:200
            }

            states: [
                State{
                    name: "ascend"
                    StateChangeScript{ name: "saitaScript"; script: { timerSaita.restart() } }
                    PropertyChanges{ target: saitaImage; rotation:-15 }
                },
                State{
                    name: "default"
                    PropertyChanges{ target: saitaImage; rotation:0 }
                }
            ]

            transitions: [
                Transition{
                    NumberAnimation{ target: saitaImage; properties: "rotation" }
                },
                Transition {
                    from: "ascend"
                    to: "default"
        //            reversible: true
                    NumberAnimation{ target: saitaImage; properties: "rotation" }
                }
            ]
        }
    }
    states: [
        State {
            name: "night"

            PropertyChanges { target: startupAnimationScreen; shadowImageOpacity: 1.0 }
        }
    ]

    transitions: [
        Transition{
            NumberAnimation{ target: startupAnimationScreen; properties: "shadowImageOpacity"; duration: 200 }
        }
    ]

    Component.onCompleted: onceRunTimer.running = true;
}
