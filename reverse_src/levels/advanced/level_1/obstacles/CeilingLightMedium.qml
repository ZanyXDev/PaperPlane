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
import Box2D 1.0

Body {
    id: bodyItem
    width: 87
    height: 200
    y: worldClassroom.ceilingWallHeight

    property string image: "../images/obstacles/ceiling_light_medium.png"
    property int cableHeight: 120
    property int cableWidth: 5

    bodyType: Body.Static

    sleepingAllowed: true

    fixtures: [
        Box{
            x:bodyItem.width/2 - cableWidth/2
            y:0
            width: cableWidth
            height: cableHeight
        },
        Polygon {
            vertices: [
                Qt.point(32,120),
                Qt.point(4,192),
//                Qt.point(46,197),
                Qt.point(83,193),
                Qt.point(54,120)
            ]
        }
    ]

    Image {
        id: imageItem
//        anchors.fill: parent;
        source: bodyItem.image
    }

    states:[
        State{
            name: "inActive"

            PropertyChanges{ target: bodyItem; active: false }
            PropertyChanges{ target: imageItem; opacity: 0.4 }
        }
    ]

    transitions: [
        Transition {
            reversible: true;
            NumberAnimation{ target: imageItem; properties: "opacity"; duration: 200 }
        }
    ]
}