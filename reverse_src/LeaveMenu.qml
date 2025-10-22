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
    signal yesClicked();
    signal noClicked();

    width: 412
    height: 240

    Column{
        anchors.centerIn: parent
        spacing: 20

        Image {
            source: "assets/images/menu/button/question.png"
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Row{
            spacing: 60

            Item{
                width: 100
                height: 80
                Image{
                    source: yesArea.pressed? "assets/images/menu/button/yes_pressed.png": "assets/images/menu/button/yes.png"
                    anchors.centerIn: parent

                    Image {
                        id: yesIconShadow
                        anchors.rightMargin: 3
                        anchors.topMargin: 3
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !yesArea.pressed
                    }

                    MouseArea{
                        id: yesArea
                        anchors.fill: parent

                        onClicked: yesClicked()
                    }
                }
            }

            Item{
                width: 100
                height: 80
                Image{
                    source: noArea.pressed? "assets/images/menu/button/no_pressed.png": "assets/images/menu/button/no.png"
                    anchors.centerIn: parent

                    Image {
                        id: noIconShadow
                        anchors.rightMargin: 3
                        anchors.topMargin: 3
                        source: "assets/images/menu/button/shadowed_buttons.png"
                        anchors.fill: parent
                        visible: !noArea.pressed
                    }

                    MouseArea{
                        id: noArea
                        anchors.fill: parent

                        onClicked: noClicked()
                    }
                }
            }
        }
    }
}
