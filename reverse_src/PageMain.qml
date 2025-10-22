/****************************************************************************
**
** This file is part of Saita @ School
**
** Copyright (c) 2011 Nikolaos Gerontidis.*
** All rights reserved.
** Contact:  Nikolaos Gerontidis (n.gerontidis@idealapps.gr)
**
** You may use this file under the terms of the license as follows:
**
** Redistribution in source and binary forms, with or without
** modification, are prohibitted without prior written permission by
** Nikolaos Gerontidis.
** Editing this file is prohibitted without prior written permission by
** Nikolaos Gerontidis.
**
****************************************************************************/

import QtQuick 1.1
import com.nokia.meego 1.0

Page {
    id: pageMain

    property bool soundEffectsMuted: false

    property bool musicMuted: false

    property bool trial: true

    property int message: 1

    property alias audioController: audioController

    orientationLock: PageOrientation.LockLandscape

    AudioController{
        id: audioController
    }

    function playTapSoundEffect(){
        tapSoundEffect.stop();
        tapSoundEffect.play()
    }

    function playLostSoundEffect(){
        lostSoundEffect.stop()
        lostSoundEffect.play()
    }

    function resetAudio(){
        soundEffectsMuted = !soundEffectsMuted;
        musicMuted = !musicMuted

        soundEffectsMuted = !soundEffectsMuted;
        musicMuted = !musicMuted

        tapSoundEffect.source = ''
        tapSoundEffect.source = 'assets/audio/effects/tap.wav'
    }

    StartUpAnimationScreen{
        id: startupAnimationScreen
        anchors.fill: parent
        visible: true
    }

    CustomMenu {
        id: menu
        x: 0
        anchors.horizontalCenterOffset: 0
        visible: true
        anchors.horizontalCenter: parent.horizontalCenter
        z:1
        anchors.verticalCenter: parent.verticalCenter

        onHelpClicked: pageStack.push(Qt.resolvedUrl('HelpScreen.qml'));
        onAboutClicked: pageStack.push(Qt.resolvedUrl('PageAbout.qml'))
        onArcadeClicked: pageStack.push(Qt.resolvedUrl('ArcadeCanvas.qml'));
    }

    states : [
        State{
            name: "menu"
            PropertyChanges { target: menu; visible: true; opacity: 1.0; }
            PropertyChanges { target : startupAnimationScreen; opacity:1; visible: true; timerRunning: true }
        },
        State {
            name: "arcade"
            PropertyChanges { target : startupAnimationScreen; opacity:0; visible: false; timerRunning: false }
            PropertyChanges { target: menu; visible: false; opacity: 0.0; y: pageMain.height / 2 - menu.height / 2 - 20 }
        }
    ]

    transitions: [
        Transition {
            from: "arcade"; to: "menu"; reversible: true;
            PropertyAction { target: menu; property: "visible"; }
            NumberAnimation { target: menu; properties: "y,opacity"; duration: 200; }
        },
        Transition {
            from: "menu"; to: "race"; reversible: true;
            PropertyAction { target: menu; property: "visible"; }
            NumberAnimation { target: menu; properties: "y,opacity"; duration: 200; }
        }
    ]
}
