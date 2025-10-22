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
    width: 94
    height: 165
    y: worldClassroom.height - worldClassroom.floorWallHeight - height

    property string image: "../images/obstacles/verybig_deck.png"
    property int bottomPartHeight: 85
    property int bottomPartWidth: 80

    bodyType: Body.Static

    sleepingAllowed: true

    fixtures: [
        Polygon{
            vertices: [
                Qt.point(17,2),
                Qt.point(18,33),
                Qt.point(91,33),
                Qt.point(91,2)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(6,33),
                Qt.point(7,66),
                Qt.point(78,66),
                Qt.point(79,33)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(14,66),
                Qt.point(14,85),
                Qt.point(82,85),
                Qt.point(82,66)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(4,85),
                Qt.point(4,114),
                Qt.point(77,114),
                Qt.point(77,85)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(21,114),
                Qt.point(21,133),
                Qt.point(90,133),
                Qt.point(90,117)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(14,133),
                Qt.point(14,164),
                Qt.point(82,164),
                Qt.point(82,133)
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
