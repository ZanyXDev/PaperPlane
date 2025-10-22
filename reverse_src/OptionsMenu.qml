// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Item {
    id: shareMenu

    signal backClicked()

    width: 412
    height: 240

    Column{
        spacing: 6
        anchors.centerIn: parent

        Row{
            spacing: 10
            anchors.horizontalCenter: parent.horizontalCenter

            Column{
                id: soundEffectsItem
                width: 130
                height: 100
                spacing: 6

                Image {
                    id: soundeffectstitle
                    source: "assets/images/menu/options_menu/effects.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image{
                    id: soundEffects
                    source: pageMain.soundEffectsMuted? "assets/images/menu/button/icon_effects_off.png" : "assets/images/menu/button/icon_effects_on.png"
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image {
                        id: soundEffectsIconShadow
                        anchors.rightMargin: 2
                        anchors.topMargin: 3
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !soundEffectsArea.pressed
                    }
                }

                MouseArea{
                    id: soundEffectsArea
                    anchors.fill: parent
                    onClicked: { pageMain.audioController.playTapSoundEffect(); pageMain.soundEffectsMuted = !pageMain.soundEffectsMuted }
                }
            }

            Column{
                id: musicItem
                width: 130
                height: 100
                spacing: 6

                Image {
                    id: musictitle
                    source: "assets/images/menu/options_menu/music.png"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Image{
                    id: musicOff
                    source: pageMain.musicMuted? "assets/images/menu/button/icon_music_off.png" : "assets/images/menu/button/icon_music_on.png"
                    anchors.horizontalCenter: parent.horizontalCenter

                    Image {
                        id: musicIconShadow
                        anchors.rightMargin: 2
                        anchors.topMargin: 3
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !musicArea.pressed
                    }
                }

                MouseArea{
                    id: musicArea
                    anchors.fill: parent

                    onClicked: { pageMain.audioController.playTapSoundEffect(); pageMain.musicMuted = !pageMain.musicMuted }
                }
            }
        }

        Column{
            width: 130
            height: 100
            spacing: 6
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                id: backtitle
                source: "assets/images/menu/button/back_title.png"
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Image{
                id: backIcon
                source: backArea.pressed? "assets/images/menu/button/back_pressed.png": "assets/images/menu/button/back.png"
                anchors.horizontalCenter: parent.horizontalCenter

                Image {
                    id: backIconShadow
                    anchors.rightMargin: 3
                    anchors.topMargin: 3
                    source: "assets/images/menu/button/shadowed_buttons.png"
                    anchors.fill: parent
                    visible: !backArea.pressed
                }
            }

            MouseArea
            {
                id: backArea
                anchors.fill: parent
                onClicked: backClicked()
            }
        }
    }
}
