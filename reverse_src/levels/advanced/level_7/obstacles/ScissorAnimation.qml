// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Box2D 1.0

Body{
    id: scissorAnimation
    width: 48
    height: 48

    bodyType: Body.Kinematic

    opacity: 0.0;
    rotation: 90

    property string closedScissorPath: "images/extras/apple_bitten.png"

    property int animationDuration: 200

    signal finished()

    property int loops: 4

    property int counter: 0

    property int translateValue: 0


    Image{
        id: image
        anchors.fill: parent
        source: "../images/extras/scissor1.png"
    }

    function show(){
//        pageMain.audioController.playAppendBonusItemSoundEffect();

        scissorAnimation.state = 'show'

        timer.restart();
    }

    function toggleState(){
        if(counter%2 == 0 || !counter)
            state = 'front'
        else
            state = 'back'
    }

    transform: Translate{ x: translateValue }

//    Image{
//        id: helperImage
//        width: parent.width
//        height: parent.height
//        y: -parent.height/1.5
//        x: parent.height/7
//        source: image.source
//        z:1
//    }

    Timer{
        id: timer
        interval: animationDuration
        running: false
        repeat: true
        onTriggered: {
            counter++;

            if(counter == loops){
                timer.stop()
                scissorAnimation.opacity = 0.0

                finished()
            }
            else
                toggleState()
        }
    }

    states:[
        State{
            name: "front"

            PropertyChanges{ target: scissorAnimation; translateValue: -20; opacity: 1.0 }
        },
        State{
            name: "back"

            PropertyChanges{ target: scissorAnimation; translateValue: 20; opacity: 1.0 }
        }
    ]

    transitions: [
        Transition {

            to: "front"

            PropertyAnimation{ target: scissorAnimation; properties: "translateValue"; duration: animationDuration }
        },
        Transition {

            to: "back"

            PropertyAnimation{ target: scissorAnimation; properties: "translateValue"; duration: animationDuration }
        }
    ]
}
