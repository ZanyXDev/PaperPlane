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
    y: Math.floor(Math.random()*(worldClassroom.height/2 - worldClassroom.ceilingWallHeight.wallHeight))
    sleepingAllowed: true

    property string image: "NOT SET"
    property real bDensity: 0.8
    property real bFriction: 0.6
    property real bRestitution: 0.9

    fixtures: Circle {
        id: boxShape
        radius: 35
        density: bodyItem.bDensity
        restitution: bodyItem.bRestitution
        friction: bodyItem.bFriction
    }

    Image {
        id: imageItem
        width: boxShape.radius * 2
        height: width
//        smooth: true
        source: bodyItem.image
        anchors.centerIn: parent
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
            NumberAnimation{ target: imageItem; properties: "opacity"; duration: 200 }
        }
    ]
}