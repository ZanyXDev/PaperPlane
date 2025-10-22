/****************************************************************************
**
** This file is part of Glinder adventures
**
** Copyright (c) 2011 Nikolaos Gerontidis.
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
import com.nokia.meego 1.0

PageStackWindow {
    id: window
    showStatusBar: false

    initialPage: pageMain

    PageMain {
        id: pageMain
    }

    property bool appFocused: true

    onAppFocusedChanged: appFocused? window.state = 'fullsize-visible': window.state  = 'thumbnail-or-invisible'

    function pauseGame(){
        pageStack.find(function(page){
                           return page.message == "3";
                       }).pauseGame();
    }

    function getState(){
        var page = pageStack.find(function(page){
                           return page.message == "3";
                       });

        if(page != null)
            return page.state;
    }

    Image{
        id: splashImage
        source: "assets/images/saita_splash.png"
        fillMode: Image.Stretch
        visible: true
    }

    Timer{
        id: timer
        running: false
        interval: 2500

        onTriggered: splashImage.visible = false;
    }

    states: [
        State {
            name: "fullsize-visible"
            when: platformWindow.viewMode == WindowState.Fullsize && platformWindow.visible
            StateChangeScript {
                script: {

                    console.log("Visibility: Fullsize and visible!")
                }
            }
        },
        State {
            name: "thumbnail-or-invisible"
            when: platformWindow.viewMode == WindowState.Thumbnail || !platformWindow.visible

            StateChangeScript {
                script: {
                    if(getState() === 'running')
                    {
                        pauseGame()
//                        pageMain.arcadeCanvas.pauseGame();
//                        pageMain.arcadeCanvas.state = 'paused';
                    }

                    console.log("Visibility: Not fullsize (Thumbnail and/or invisible)")
                }
            }
        }
    ]

    Component.onCompleted: timer.start();
}
