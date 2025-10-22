/****************************************************************************
**
** This file is part of Glinder adventures
**
** Copyright (c) 2011 Nikolaos Gerontidis.*
** All rights reserved.
** Contact:  Nikolaos Gerontidis (n.gerontidis@idealapps.gr)
**
** You may use this file under the terms of the license as follows:
**
** "Redistribution in source and binary forms, with or without
** modification, are prohibitted without prior written permission by
** Nikolaos Gerontidis.
**
****************************************************************************/

import QtQuick 1.1

Item {
    signal resumeClicked();
    signal mainMenuClicked();

    width: 150
    height: 480

    Image{
        anchors.fill: parent
        source: "assets/images/menu/pause_wall.png"
    }

    Column{
        spacing: 25
        anchors.centerIn: parent
        z:1

//        Item{
//            width: 80
//            height: 80

//            Image{
//                id: resumeImage
//                anchors.centerIn: parent
//                source: resumeArea.pressed? "assets/images/buttons/resume_pressed.png" : "assets/images/buttons/resume.png"

//                Image {
//                    id: resumeIconShadow
//                    anchors.rightMargin: 2
//                    anchors.topMargin: 3
//                    source: "assets/images/menu/button/shadowed_buttons.png"
//                    anchors.fill: parent
//                    visible: !resumeArea.pressed
//                }
//            }

//            MouseArea{
//                id: resumeArea
//                anchors.fill: parent
//                onClicked: { playTapSoundEffect(); resumeClicked() }
//            }
//        }

        Item{
            width: 80
            height: 80

            Image{
                id: mainMenuImage
                source: mainMenuArea.pressed? "assets/images/buttons/main_menu_pressed.png" : "assets/images/buttons/main_menu.png"
                anchors.centerIn: parent

                Image {
                    id: mainMenuIconShadow
                    anchors.rightMargin: 2
                    anchors.topMargin: 3
                    source: "assets/images/menu/button/shadowed_buttons.png"
                    anchors.fill: parent
                    visible: !mainMenuArea.pressed
                }
            }

            MouseArea{
                id: mainMenuArea
                anchors.fill: parent
                onClicked: { playTapSoundEffect(); mainMenuClicked() }
            }
        }

        Item{
            width: 80
            height: 80

            Image{
                id: soundEffects
                source: pageMain.soundEffectsMuted? "assets/images/menu/button/icon_effects_off.png" : "assets/images/menu/button/icon_effects_on.png"
                anchors.centerIn: parent

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
                onClicked: { playTapSoundEffect(); pageMain.soundEffectsMuted = !pageMain.soundEffectsMuted }
            }
        }

        Item{
            width: 80
            height: 80

            Image{
                id: musicOff
                source: pageMain.musicMuted? "assets/images/menu/button/icon_music_off.png" : "assets/images/menu/button/icon_music_on.png"
                anchors.centerIn: parent

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
                onClicked: { playTapSoundEffect(); pageMain.musicMuted = !pageMain.musicMuted; pageMain.soundEffectsMuted = !pageMain.soundEffectsMuted; pageMain.soundEffectsMuted = !pageMain.soundEffectsMuted }
            }
        }
    }
}
