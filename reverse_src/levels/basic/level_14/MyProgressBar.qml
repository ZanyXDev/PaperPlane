// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: myProgressBar
    property real value: myProgressBar.width

    property bool mPBRunning: false

    property double seconds: 7.0

    property bool active: false

    signal finished()

    width: 100
    height: 15

    color: "white"
    border.color: "grey"
    border.width: 1
    radius: 10

    Timer{
        id: myTimer
        repeat: true
        running: mPBRunning
        interval: 50

        onTriggered: {
            if(Math.floor(value) > 0){
                active = true;
                value -= myProgressBar.width/(seconds*20.0);
            } else {
                finished();
                active = false
            }
        }
    }

    function reset(){
        value = Math.floor(myProgressBar.width);
    }

    function stop(){
        active = false;
    }

    Rectangle{
        id: resizableFrame
        width: Math.floor(value)
        height: myProgressBar.height
        anchors.right: parent.right
        color: value < myProgressBar.width/3? "red": "blue"
        radius: 10
    }
}
