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
    width: 84
    height: 51
    y: worldClassroom.height - worldClassroom.floorWallHeight - height

    property string bodyMode: "static"

    property string image: "../images/obstacles/small_deck.png"
    property int bottomPartHeight: 85
    property int bottomPartWidth: 80

    property double aDensity: 0.2
    property double aFriction: 0.1
    property double restitution: 0.2

    bodyType: bodyMode === "static"?Body.Static : Body.Dynamic

    sleepingAllowed: true

    fixtures: [
        Polygon{
            density: aDensity
            friction: aFriction
            restitution: restitution
            vertices: [
                Qt.point(12,2),
                Qt.point(12,19),
                Qt.point(82,19),
                Qt.point(82,2)
            ]
        },
        Polygon{
            density: aDensity
            friction: aFriction
            restitution: restitution
            vertices: [
                Qt.point(5,19),
                Qt.point(5,50),
                Qt.point(72,50),
                Qt.point(72,19)
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
