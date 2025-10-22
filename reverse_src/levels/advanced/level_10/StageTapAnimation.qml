// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: stageTapAnimation
    width: 64
    height: 64
    color: "transparent"
    radius: 45
    border.width: 1
    border.color: "#8d8d8d"
    opacity: 0.0

    function start(){
        state = ''
        state = 'show'
    }

    states:[
        State{
            name: "show"

            PropertyChanges{ target: stageTapAnimation; scale: 2.0; opacity: 0.0; border.width: 1 }
        }
    ]

    transitions: [
        Transition{
            to: "show"

            SequentialAnimation{
                ScriptAction{script: { opacity = 1.0; border.width = 5 } }
                ParallelAnimation{
                    NumberAnimation{ duration: 200; properties: "scale,border.width"; easing.type: Easing.OutInQuad }
                }
                NumberAnimation{ duration: 50; properties: "opacity"; easing.type: Easing.OutQuad}
                ScriptAction{script: { scale = 1; border.width = 1 } }
            }
        }

    ]
}
