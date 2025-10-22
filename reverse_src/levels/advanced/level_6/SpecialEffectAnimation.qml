// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Image {
    id: specialEffectAnimation

    width: 48
    height: 48
    source: "images/extras/bell.png"
    opacity: 0.0;

    property int specialEffectAnimationDuration: 600

    function show(){
//        classroom.audioController.playAppendSpecialEffectSoundEffect();

        specialEffectAnimation.state = 'show'

        timer.restart();
    }

    Timer{
        id: timer
        interval: specialEffectAnimationDuration
        running: false
        onTriggered: {
            // append a list element to the specialEffect model
            var path = "images/extras/bell.png";

            specialEffectAnimation.state = ''
        }
    }

    states:[
        State{
            name: "show"

            PropertyChanges{ target: specialEffectAnimation; opacity: 1.0; width:16; height:16; x: specialEffectsView.x+(specialEffectModel.count*16); y: specialEffectsView.y+specialEffectsView.height }
        }
    ]

    transitions: [
        Transition {
            SequentialAnimation{
                NumberAnimation{ target: specialEffectAnimation; properties: "x,y,width,height"; duration: specialEffectAnimationDuration }
            }
        }
    ]
}
