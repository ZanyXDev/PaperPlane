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
    id: saita

    fixedRotation: true
    width: 64
    height: 60
    z:200

    property string imagepath: "images/saita/saita.png"
    property string imagelost: "images/saita/saita_damaged.png"
    property string imagebullet: "images/saita/bullet.png"
    property string imagestealth: "images/saita/stealth_effect.png"
    property string imagestealthlight: "images/saita/stealth_effect_extra_light.png"
    property string imagebullet1: "images/saita/bullet1.png"
    property string imagebullet2: "images/saita/bullet2.png"

    property double proportion: 1.4

    property bool player: true

    property double aDensity: 0.2 // this is the default density which causes the saita to stay on air
    property double aFriction: 0.7
    property double aConstitution: 0.1

    property int offset: classroom.width / 5

    property int currentCenterX: x - offset

    function rotateSaita(){
        saita.rotation = -10

        rotateTimer.restart()
    }

    signal contactWithObstacles()

    Behavior on rotation{
        NumberAnimation{ duration: 400 }
    }

    Timer{
        id: rotateTimer
        interval: 600
        running: false
        onTriggered: saita.rotation = 0

    }

    fixtures: [
        Polygon {
            id: firstPolygon
            density: aDensity
            friction: aFriction
            restitution: aConstitution
            vertices: [
                Qt.point(6,3),
                Qt.point(27,59),
                Qt.point(63,35)
            ]
            onBeginContact: contactWithObstacles()
        },
        Polygon {
            id: secondPolygon
            density: aDensity
            friction: aFriction
            restitution: aConstitution
            vertices: [
                Qt.point(14,25),
                Qt.point(3,54),
                Qt.point(23,51)
            ]
            onBeginContact: contactWithObstacles()
        }
    ]

    Image {
        id:saitaImage
        source: imagepath
        smooth: true
        fillMode: Image.PreserveAspectFit
//        rotation: saita.linearVelocity.y > 0? 0:-10

        z:200
    }

    Image{
        id: fingerImage
        anchors.horizontalCenterOffset: 5
        anchors{ bottom: parent.bottom; bottomMargin: -3; horizontalCenter: parent.horizontalCenter }
        source: "images/hand/back_finger.png"
        z:199
        visible: false
    }

    Image{
        id: lighterImage
        source: imagestealthlight
        visible: false

        SequentialAnimation {
            running: lighterImage.visible
            loops: Animation.Infinite
            PropertyAnimation{ target: lighterImage; property: "visible"; from: false; to: true }
            PropertyAnimation{ target: lighterImage; property: "visible"; from: true; to: false }
        }
    }

    states: [
        State{
            name: "onHand"
            PropertyChanges{ target: fingerImage; visible: true }
        },
        State{
            name: "running"

            PropertyChanges{ target: saitaImage; source: imagepath }
            PropertyChanges{ target: fingerImage; visible: false }
            PropertyChanges{ target: lighterImage; visible: false }
        },
        State{
            name: "lost"

            PropertyChanges { target: saitaImage; source: imagelost }
            PropertyChanges{ target: fingerImage; visible: false }
            PropertyChanges{ target: lighterImage; visible: false }
        },State{
            name: "bullet"

            StateChangeScript{ name: "bulletScript1"; script: { console.log('bullet script 1 ..'); saita.linearVelocity = Qt.point(saita.linearVelocity.x*proportion,saita.linearVelocity.y); } }
            StateChangeScript{ name: "bulletScript2"; script: { console.log('bullet script 2 ..'); saita.linearVelocity = Qt.point(saita.linearVelocity.x*proportion,saita.linearVelocity.y); } }
            StateChangeScript{ name: "bulletScript3"; script: { console.log('bullet script 3 ..'); saitaImage.source = imagebullet } }

            PropertyChanges { target: saitaImage; source: imagebullet }
            PropertyChanges{ target: fingerImage; visible: false }
            PropertyChanges{ target: lighterImage; visible: false }
        },State{
            name: "stealth"

            PropertyChanges{ target: saitaImage; source: imagestealth }
            PropertyChanges{ target: fingerImage; visible: false }
            PropertyChanges{ target: lighterImage; visible: true }
        }
    ]

    transitions: [
        Transition{

            from: "running"
            to: "bullet"

            SequentialAnimation{
                PropertyAnimation { target:saitaImage; property:"source"; to: imagebullet2; duration:150 }
                ScriptAction{ scriptName: "bulletScript1" }
                PropertyAnimation { target:saitaImage; property:"source"; from:imagebullet2; to: imagebullet1; duration:150 }
                ScriptAction{ scriptName: "bulletScript2" }
                PropertyAnimation { target:saitaImage; property:"source"; from:imagebullet1; to: imagebullet; duration:150 }
                ScriptAction{ scriptName: "bulletScript3" }
            }
        },Transition{

            from: "running"
            to: "stealth"

            SequentialAnimation{
                PropertyAnimation { target:saitaImage; property:"source"; from:imagepath; to: imagestealth; duration:300 }
                PropertyAnimation { target:saitaImage; property:"source"; from:imagestealth; to: imagestealthlight; duration:400 }
            }
        },Transition{

            from: "bullet"
            to: "running"

            PropertyAnimation{ target:saitaImage; property:"source"; duration:300 }
        }
    ]
}
