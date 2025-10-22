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
    height: 102
    y: worldClassroom.height - worldClassroom.floorWallHeight - height

    property string image: "../images/obstacles/big_deck.png"
    property int bottomPartHeight: 85
    property int bottomPartWidth: 80

    bodyType: Body.Static

    sleepingAllowed: true

    fixtures: [
        Polygon{
            vertices: [
                Qt.point(14,2),
                Qt.point(14,21),
                Qt.point(82,21),
                Qt.point(82,2)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(4,21),
                Qt.point(4,50),
                Qt.point(77,50),
                Qt.point(77,21)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(21,50),
                Qt.point(21,69),
                Qt.point(90,69),
                Qt.point(90,53)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(14,69),
                Qt.point(14,100),
                Qt.point(82,100),
                Qt.point(82,69)
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
