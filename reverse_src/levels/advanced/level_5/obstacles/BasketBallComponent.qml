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

    property string image: "../images/obstacles/basketball.png"

    property double bDensity: 0.3
    property double bFriction: 0.6
    property double bRestitution: 0.95

    property variant initialLinearVelocity: Qt.point(0,0)

    property int _radius: 27

    width: _radius * 2+2
    height: _radius * 2

    Image{
        id: shadowImage
        source: "../images/obstacles/basketball_shadow.png"
        width: _radius * 2-1
        height: _radius * 2-3
        x: bodyItem.x-_radius
        y: bodyItem.y-_radius
        z:1
        parent: worldClassroom
    }

    Body {
        id: bodyItem
        sleepingAllowed: true
        parent: worldClassroom
        x: containerItem.x
        y: containerItem.y

        fixtures: Circle {
            id: circle
            radius: _radius
            density: bDensity
            restitution: bRestitution
            friction: bFriction

            onBeginContact: { if((classroom.state !== 'lost' || classroom.state !== 'win' || classroom.state !== 'paused') && bodyItem.y >= worldClassroom.height - worldClassroom.floorWallHeight-containerItem.height-2)levelView.playBounceSoundEffect(); else console.log('cannot play bounce effect bodyItem.y : ' + bodyItem.y) }
        }

        Image {
            id: imageItem
            source: containerItem.image
            anchors.centerIn: parent
            width: _radius * 2
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

    Component.onCompleted: bodyItem.linearVelocity = initialLinearVelocity
}
