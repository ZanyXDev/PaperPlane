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

Image {
    id: customButton
    property url normalImage
    property url pressedImage

    property alias pressed: mouseArea.pressed

    signal clicked();

    source: mouseArea.pressed ? pressedImage : normalImage
    smooth: true

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: customButton.clicked();

    }
}
