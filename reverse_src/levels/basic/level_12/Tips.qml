// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: tipItem
    width: 221
    height: 316

    signal okClicked()

    anchors{ left: parent.left; leftMargin: 100; verticalCenter: parent.verticalCenter }

    Image{
        id: background
        source:"../../../assets/images/menu/tips/saitaz_height.png"
        anchors.fill: parent
    }

    Image{
        id: okButton
        source: "images/other/ok.png"
        width: 64
        height: 64
        anchors { bottom: parent.bottom; bottomMargin: 10; right: parent.right; rightMargin: 6 }

        MouseArea{
            anchors.fill: parent
            onClicked: { okClicked(); levelView.showTipsOnStart = false; tipItem.state = 'hide' }
        }
    }

    states: [
        State {
            name: "hide"

            PropertyChanges { target: tipItem; opacity: 0.0 }
        }
    ]

    transitions: [
        Transition {
            to: "hide"
            NumberAnimation{ properties: "opacity"; duration: 350 }
        }
    ]
}
