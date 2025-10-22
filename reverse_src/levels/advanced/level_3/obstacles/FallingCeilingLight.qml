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
    id: fallingCeilingLight
    width: 87
    height: cableHeight + 100
    y: 0

    property int cableHeight: 120
    property int cableWidth: 5

    property string modeType: "not set"

    property int crashCounter: 0

    function updateFixtures(){

        rodItem.resetItem();
        lampItem.resetItem();
    }

    Body {
        id: rodItem
        x: fallingCeilingLight.x + fallingCeilingLight.width/2 - 5
        y: worldClassroom.ceilingWallHeight

        onYChanged: {
            if(worldClassroom.height > 0 && y >= worldClassroom.height - cableHeight - worldClassroom.floorWallHeight- 1)
            {
                console.log('touched floor .. | y : ' + y + ' worldClassroom.height : ' + worldClassroom.height)

                rodItem.active = false
                rodImage.visible = false
            }
        }

        parent: worldClassroom

        bodyType: modeType === "static"? Body.Static: Body.Dynamic

        sleepingAllowed: true
        fixedRotation: false

        fixtures: [

            Box{
                id: rodFixture
                width: cableWidth
                height: cableHeight
            }
        ]

        Image{
            id: rodImage
            width: rodFixture.width
            height: rodFixture.height
            visible: rodItem.active? true: false
//            anchors.horizontalCenter: fallingCeilingLight.horizontalCenter
//            anchors.bottomMargin: -7
//            anchors.topMargin: -3
            source: "../images/obstacles/stick.png"
            z:1
        }
    }

    Body{
        id: lampItem
//        anchors.top: rodItem.bottom
        parent: worldClassroom
        x: fallingCeilingLight.x
        fixedRotation: false
        sleepingAllowed: true

        fixtures: [
            Polygon {
                id: lampFixture
                vertices: [
                    Qt.point(39,cableHeight),
                    Qt.point(5,cableHeight+112),
                    Qt.point(102,cableHeight+113),
                    Qt.point(66,cableHeight)
                ];

                onEndContact: if(classroom.running && crashCounter == 1){ levelView.playLampCrashSoundEffect(); crashCounter = 0; console.log('play lamp crash sound effect .. ') }else { crashCounter++; console.log('crashCounter : ' + crashCounter) }
            }
        ]

        Image {
            id: lampImageItem
            y:cableHeight
            width: fallingCeilingLight.width
            height: 113
            source: "../images/obstacles/lamb.png"
        }
    }

    Body {
        id: connector
        fixedRotation: true
        sleepingAllowed: false
        bodyType: Body.Static
        parent: worldClassroom

        width: cableWidth
        height: cableWidth

        x: rodItem.x
        y: rodItem.height - cableWidth/2

        fixtures: Circle {
            id: circleShape
            radius: connector.width / 2
            anchors.fill: parent
        }
    }

    RevoluteJoint{
        id: revolute1
        maxMotorTorque: 10
        motorSpeed: 0
        bodyA: connector
        bodyB: lampItem
        world: worldClassroom
    }

    RevoluteJoint{
        id: revolute2
        maxMotorTorque: 10
        motorSpeed: 0
        bodyA: connector
        bodyB: rodItem
        world: worldClassroom
    }

    RevoluteJoint {
        id: revolute
        maxMotorTorque: 10
        motorSpeed: 0
        bodyA: ceiling
        bodyB: rodItem
        world: worldClassroom
        collideConnected: false
    }

    states:[
        State{
            name: "fall"

            StateChangeScript{ name: "fallScript"; script: {

                    revolute1.removeJoint();
                    revolute2.removeJoint();
                    revolute.removeJoint();

//                    connector.destroy();
                    connector.active = false

                    updateFixtures()
                }
            }

//            PropertyChanges{ target: rodImage; visible: false }
//            PropertyChanges{ target: bodyItem; active: false }
//            PropertyChanges{ target: imageItem; opacity: 0.4 }
        }
    ]

    transitions: [
        Transition {
            reversible: true;
//            NumberAnimation{ target: imageItem; properties: "opacity"; duration: 200 }
        }
    ]
}
