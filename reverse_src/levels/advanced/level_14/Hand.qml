// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item{
    id: hand

    property real wrestOpacity: 1
    property real fingerOpacity: 1
    property real openHandOpacity: 0
    property real frontHandOpacity: 1

    Image{
        id: wrestImage
        source: "images/hand/wrest.png"
        opacity: wrestOpacity
        z:200
    }

    Image{
        id: frontHandImage
        z: 201
        anchors.left: wrestImage.right
        anchors.leftMargin: -32
        anchors.top: parent.top
        anchors.topMargin: -29
        source: "images/hand/front_hand.png"
        opacity: frontHandOpacity
    }

    Image{
        id: openHand
        z: 201
        anchors.left: wrestImage.right
        anchors.leftMargin: -32
        anchors.top: parent.top
        anchors.topMargin: -29
        source: "images/hand/open_hand.png"
        opacity: openHandOpacity
    }

    states:[
        State{
            name: "open"

            PropertyChanges { target: hand; frontHandOpacity: 0; openHandOpacity:1 }
        }
    ]

    transitions:[
        Transition{
            to: "open"
            ParallelAnimation{
                PropertyAnimation{ target: hand; properties: "frontHandOpacity"; duration: 300 }
                PropertyAnimation{ target: hand; properties: "openHandOpacity"; duration: 300 }
            }
        }

    ]
}
