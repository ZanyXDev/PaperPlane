/****************************************************************************
**
** This file is part of Glinder adventures
**
** Copyright (c) 2011 Nikolaos Gerontidis.
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
    id: menu
    width: menuImage.width
    height: menuImage.height

    signal helpClicked();
    signal aboutClicked();
    signal optionsClicked();
    signal arcadeClicked();

    state: "default"

    property int xoffset: 1

    Image {
        id: menuImage
        opacity: 0.90
        source: "assets/images/menu/wall_frame_scaled.png"
    }

    StartMenu {
        id: startMenu
        anchors.rightMargin: 10
        anchors.leftMargin: 0
        anchors.fill: menu
        anchors.topMargin: 13

        onPlayClicked: { pageMain.audioController.playTapSoundEffect(); menu.arcadeClicked() }
        onHelpClicked: { pageMain.audioController.playTapSoundEffect(); menu.helpClicked(); }
        onOptionsClicked: {pageMain.audioController.playTapSoundEffect(); menu.state = 'options' }
        onShareClicked: { pageMain.audioController.playTapSoundEffect(); menu.state = 'share' }
        onAboutClicked: { pageMain.audioController.playTapSoundEffect(); menu.aboutClicked() }
        onExitClicked: { pageMain.audioController.playTapSoundEffect(); menu.state = 'leave' }
    }

    LeaveMenu {
        id: leaveMenu
        opacity: 0.0
        visible: false
        anchors.fill: parent

        onYesClicked: { Qt.quit() }
        onNoClicked: { pageMain.audioController.playTapSoundEffect(); menu.state = "default"; }
    }

    ShareMenu{
        id: shareMenu
        anchors.leftMargin: 10
        opacity: 0.0
        visible: false
        anchors.fill: parent
        anchors.topMargin: 10

        onBackClicked: { pageMain.audioController.playTapSoundEffect(); menu.state = 'default' }
    }

    OptionsMenu{
        id: optionsMenu
        anchors.leftMargin: 0
        opacity: 0.0
        visible: false
        anchors.fill: parent
        anchors.topMargin: 8

        onBackClicked: { pageMain.audioController.playTapSoundEffect(); menu.state = 'default' }
    }

    states : [
        State {
            name: "default"
            PropertyChanges { target: startMenu; opacity: 1.0; visible: true; }
            PropertyChanges { target: leaveMenu; opacity: 0.0; visible: false }
        },State {
            name: "about"
            PropertyChanges { target: startMenu; opacity: 0.0; visible: false; }
        },State {
            name: "leave"
            PropertyChanges { target: startMenu; opacity: 0.0; visible: false; }
            PropertyChanges { target: leaveMenu; opacity: 1.0; visible: true; }
        },State{
            name: "share"
            PropertyChanges { target: startMenu; opacity: 0.0; visible: false }
            PropertyChanges { target: shareMenu; opacity: 1.0; visible: true; }
        },State{
            name: "options"
            PropertyChanges { target: startMenu; opacity: 0.0; visible: false }
            PropertyChanges { target: optionsMenu; opacity: 1.0; visible: true; }
        }
    ]

    transitions: [
        Transition {
            from: "default"; to: "leave"; reversible: true;
            MenuAnimation { first: startMenu; second: leaveMenu; }
        },Transition {
            from: "default"; to: "options"; reversible: true;
            MenuAnimation { first: startMenu; second: optionsMenu; }
        },Transition{
            from: "default"; to: "share"; reversible: true;
            MenuAnimation { first: startMenu; second: shareMenu; }
        },Transition {
            from: "default"
            to: "playMode"
            MenuAnimation { first: startMenu; second: playModeMenu; }
        }
    ]

    function setState(state, animated) {
        if (!animated) {
            // XXX: workaround to avoid transition
            // There is a pending suggestion to avoid this (QTBUG-14488)
            menu.state = "undefined";
        }
        menu.state = state;
    }
}
