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
    id: backgroundLevel1

    width: imageA.width + imageB.width + imageC.width + imageD.width

    // this is the bottom background level,its the level contains sky and cloud elements
        Image {
        id: imageA
        source: "../images/background/walls/a.png"
        width: 854
        height: 480
    }

    Image {
        id: imageB
        x: imageA.x + imageA.width
        source: "../images/background/walls/b.png"
        width: 854
        height: 480
    }

    Image {
        id: imageC
        x: imageB.x + imageB.width
        source: "../images/background/walls/c.png"
        width: 854
        height: 480
    }

    Image {
        id: imageD
        x: imageC.x + imageC.width
        width: 808
        height: 480
        source: "../images/background/walls/d.png"
    }
}
