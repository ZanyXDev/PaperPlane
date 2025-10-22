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
import com.nokia.meego 1.0

Page {
    id: helpScreen

    orientationLock: PageOrientation.LockLandscape

    signal backClicked();

    Flickable{
        id: fliclable

        anchors.fill: parent

        contentWidth: image.width
        contentHeight: image.height
        boundsBehavior: Flickable.StopAtBounds

        Image{
            id: image

            source:"assets/images/menu/help_menu/help.png"
        }
    }

    Column{
        width: 150
        height: 100
        spacing: 6
        anchors.bottom: parent.bottom
        anchors.right: parent.right

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
                source: "assets/images/menu/button/shadowed_buttons.png"
                anchors.fill: parent
                visible: !backArea.pressed
            }
        }

        MouseArea
        {
            id: backArea
            anchors.fill: parent
            onClicked: { pageMain.audioController.playTapSoundEffect();  pageStack.pop(); }
        }
    }
}
