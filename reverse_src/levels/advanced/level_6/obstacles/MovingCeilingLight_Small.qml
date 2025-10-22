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
    id: bodyItem

    property string image: "../images/obstacles/ceiling_light_moving_small.png"

    width: 114
    height: 149
    y: 0

    Timer{
        id: squeekTimer
        repeat: true
        interval: 3000
        running: classroom.state === 'lost' || classroom.state === 'win' || classroom.state === 'paused'? false : true

        onTriggered: if(Math.abs(foreground.contentX-bodyItem.x) < 600)levelView.playLampSqueekSoundEffect();
    }

    Body {
        id: rod
        fixedRotation: false
        sleepingAllowed: false
        parent: worldClassroom

        x: bodyItem.x
        y: worldClassroom.ceilingWallHeight

        width: bodyItem.width
        height: bodyItem.height

        fixtures: [
            Polygon {
                id: cord
                density: 0.1;
                friction: 1;
                restitution: 0.3;

                vertices: [
                    Qt.point(0,4),
                    Qt.point(34,64),
                    Qt.point(38,62),
                    Qt.point(4,0)
                ]
            },
            Polygon {
                id: lamp
                density: 0.3;
                friction: 1;
                restitution: 0.3;

                vertices: [
                    Qt.point(28,69),
                    Qt.point(41,145),
//                    Qt.point(78,129),
                    Qt.point(110,106),
                    Qt.point(48,58)
                ]
            }
        ]

        Image {
            id: rodImage
            source: bodyItem.image
            width: parent.width
            height: parent.height
            anchors.top: parent.top
            anchors.topMargin: -5
        }
    }

    Body {
        id: middle
        fixedRotation: true
        sleepingAllowed: false
        bodyType: Body.Static
        parent: worldClassroom

        width: 20
        height: 20

        x: rod.x
        y: rod.y

        fixtures: Circle {
            id: circleShape
            radius: middle.width / 2
            anchors.fill: parent
        }
    }

    RevoluteJoint {
        id: revolute
        maxMotorTorque: 10
        motorSpeed: 0
        bodyA: middle
        bodyB: rod
        world: worldClassroom
    }

    states:[
        State{
            name: "inActive"

            PropertyChanges{ target: rod; active: false }
            PropertyChanges{ target: rodImage; opacity: 0.4 }
            PropertyChanges{ target: middle; active: false }
        }
    ]

    transitions: [
        Transition {
            reversible: true;
            NumberAnimation{ target: rodImage; properties: "opacity"; duration: 200 }
        }
    ]
}
