// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: lostMenu
    width: 329
    height: 228

    property int bonusItems: 0

    property int levelId: 0

    signal restart()
    signal backToMenu()

    Image{
        id:backgroundLostMenu
        source: "assets/images/menu/lost_menu/lost_menu_wall.png"
        anchors.fill: parent
        opacity: 0.90
    }

    Item{
        id: mainRect
        anchors.centerIn: parent
        opacity: 0.8
        anchors.fill: backgroundLostMenu


        Column{
            anchors.centerIn: parent
            spacing: 30

            Row{
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Item{
                    width: 80
                    height: 80

                    Image{
                        source: replayArea.pressed? "assets/images/menu/lost_menu/replay_pressed.png": "assets/images/menu/lost_menu/replay.png"
                        anchors.centerIn: parent

                        Image {
                            id: replayIconShadow
                            anchors.rightMargin: 3
                            anchors.topMargin: 3
                            source: "assets/images/menu/button/shadowed_buttons.png"
                            anchors.fill: parent
                            visible: !replayArea.pressed
                        }
                    }

                    MouseArea{
                        id: replayArea
                        anchors.fill: parent

                        onClicked: { stopLostMusic(); playTapSoundEffect(); lostMenu.restart() }
                    }
                }

                Item{
                    width: 80
                    height: 80

                    Image{
                        source: backToMenuArea.pressed? "assets/images/buttons/main_menu_pressed.png": "assets/images/buttons/main_menu_shaded.png"
                        anchors.centerIn: parent

                        Image {
                            id: backToMenuIconShadow
                            anchors.rightMargin: 3
                            anchors.topMargin: 3
                            source: "assets/images/menu/button/shadowed_buttons.png"
                            anchors.fill: parent
                            visible: !backToMenuArea.pressed
                        }
                    }

                    MouseArea{
                        id: backToMenuArea
                        anchors.rightMargin: 0
                        anchors.topMargin: 0
                        anchors.fill: parent

                        onClicked: { stopLostMusic(); playTapSoundEffect(); console.log('main menu clicked..'); lostMenu.backToMenu() }
                    }
                }
            }

            Image{
                source: "assets/images/menu/lost_menu/you_lost.png"
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }
    }
}
