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

    property string image: "../images/obstacles/ceiling_light_moving_big.png"

    width: 165
    height: 234
    y: 0

    property alias squeekTimer: squeekTimer

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
                    Qt.point(0,3),
                    Qt.point(83,149),
                    Qt.point(88,145),
                    Qt.point(3,0)
                ]
            },
            Polygon {
                id: lamp
                density: 0.3;
                friction: 1;
                restitution: 0.3;

                vertices: [
                    Qt.point(78,154),
                    Qt.point(90,231),
//                    Qt.point(129,213),
                    Qt.point(159,191),
                    Qt.point(97,143)
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
