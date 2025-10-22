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
    id: backgroundLevel2

    // this is the bottom background level,its the level contains sky and cloud elements
        Image {
        id: imageA
        source: "../images/background/outdoors/trees_1.png"
        width: 854
        height: 480
    }

    // this is the bottom background level,its the level contains sky and cloud elements
        Image {
        id: imageB
        x: imageA.width
        source: "../images/background/outdoors/trees_2.png"
        width: 376
        height: 480
    }
}
