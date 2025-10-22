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

import Qt 4.7
import Box2D 1.0

Body {
    id: wall
    bodyType: Body.Static
    fixtures: Box {
        anchors.fill: parent
        categories: Polygon.Category4
//        collidesWith: Polygon.Category2
    }
}
