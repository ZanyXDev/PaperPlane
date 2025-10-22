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

Image {
    id: about
    source: "assets/images/menu/about/about_text.png"

    signal clicked();

    MouseArea {
        anchors.fill: parent
        onClicked: about.clicked();
    }

    MouseArea {
        width: 266
        height: 61
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        onClicked: {
            Qt.openUrlExternally("http://idealapps.gr")
        }
    }
}
