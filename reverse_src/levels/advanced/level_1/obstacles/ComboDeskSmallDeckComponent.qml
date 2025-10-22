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
    height: 192
    y: worldClassroom.height - worldClassroom.floorWallHeight - height

    property string image: "../images/obstacles/desk_smalldeck.png"
    property int bottomPartHeight: 85
    property int bottomPartWidth: 80

    bodyType: Body.Static

    sleepingAllowed: true

    fixtures: [
        Polygon{
            vertices: [
                Qt.point(46,11),
                Qt.point(48,29),
                Qt.point(117,19),
                Qt.point(115,2)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(41,31),
                Qt.point(43,62),
                Qt.point(116,52),
                Qt.point(112,21)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(3,68),
                Qt.point(37,99),
                Qt.point(137,99),
                Qt.point(144,49)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(111,99),
                Qt.point(110,190),
                Qt.point(124,190),
                Qt.point(128,99)
            ]
        },
        Polygon{
            vertices: [
                Qt.point(46,180),
                Qt.point(45,186),
                Qt.point(154,190),
                Qt.point(150,178)
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
