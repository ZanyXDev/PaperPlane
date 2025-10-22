// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: bonusPanel
    width: 100
    height: 62

    property string bonusText: 'x0'
    property string imagePath: "images/extras/apple.png"

    Row{
        id: bonusRow
        anchors { left: parent.left; verticalCenter: parent.verticalCenter }
        spacing: 6
        z: 10

        Image{
            source: imagePath
            width: 20
            height: 20
            anchors.verticalCenter: parent.verticalCenter
        }

        Text{
            text: bonusText
            font{pointSize: 20; family: arcadeCanvas.localFont.name; bold: true }
            color: "blue"
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Image{
        id: finishImage
        source: imagePath
        opacity: 0.0
        anchors.top: parent.bottom
        anchors.topMargin: 10
        fillMode: Image.PreserveAspectFit
        visible: false
    }

    states:[
        State{
            name: "finish"

            PropertyChanges { target: finishImage; opacity: 1.0; visible: false }
        }
    ]

    transitions: [
        Transition {
            SequentialAnimation{
                ParallelAnimation{
                    NumberAnimation{ target: finishImage; properties: "opacity"; duration: 200}
                    NumberAnimation{ target: finishImage; properties: "width"; to: 200; duration: 200 }
                }
                ScriptAction{ script: "finishScript" }
            }
        }
    ]
}
