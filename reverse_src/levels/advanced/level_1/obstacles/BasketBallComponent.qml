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

Item{
    id: containerItem
    width: 56
    height: 54
    y: Math.floor(Math.random()*(worldClassroom.height/2 - worldClassroom.ceilingWallHeight))

    property double bDensity: 0.2
    property double bFrixtion: 0.7
    property double bRestitution: 0.7

    property string image: "../images/obstacles/basketball.png"

    Image{
        id: shadowImage
        source: "../images/obstacles/basketball_shadow.png"
        width: 53
        height: 51
        x: bodyItem.x-27
        y: bodyItem.y-27
        z:1
        parent: worldClassroom
    }

    Body {
        id: bodyItem
        sleepingAllowed: false
        parent: worldClassroom
        x: containerItem.x
        y: containerItem.y

        fixtures: Circle {
            id: circle
            radius: 27
            density: bDensity
            restitution: bRestitution
            friction: bFrixtion
        }

        Image {
            id: imageItem
            source: containerItem.image
            anchors.centerIn: parent
            width: circle.radius * 2
            height: width
        }
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
