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
    width: 159
    height: 145
    y: worldClassroom.height - worldClassroom.floorWallHeight - height

    property string image: "../images/obstacles/desk.png"
    property int bottomPartHeight: 85
    property int bottomPartWidth: 80

    bodyType: Body.Static

    sleepingAllowed: true

    fixtures: [
        Polygon{
            vertices: [
                Qt.point(3,21),
                Qt.point(37,52),
                Qt.point(137,52),
                Qt.point(144,2)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(111,52),
                Qt.point(110,143),
                Qt.point(124,143),
                Qt.point(128,52)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(46,133),
                Qt.point(45,139),
                Qt.point(154,143),
                Qt.point(150,131)
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
