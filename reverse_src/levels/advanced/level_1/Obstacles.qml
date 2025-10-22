// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    function inActivateVisibleObstacles(){
        obstacle1.state = 'inActive'
        obstacle2.state = 'inActive'
        obstacle3.state = 'inActive'
        obstacle32.state = 'inActive'
    }

    function activateVisibleObstacles(){
        obstacle1.state = 'active'
        obstacle2.state = 'active'
        obstacle3.state = 'active'
        obstacle32.state = 'active'
    }

    VeryBigDeckComponent{
        id: obstacle1
        parent: worldClassroom
        x: 835
    }

    SmallDeckComponent{
        id: obstacle2
        parent: worldClassroom
        anchors.bottom: obstacle1.top
        anchors.left: obstacle1.left
        bodyMode: "static"
    }

    SmallDeckComponent{
        id: obstacle3
        parent: worldClassroom
        anchors.bottom: obstacle2.top
        anchors.left: obstacle2.left
        bodyMode: "static"
    }

    VeryBigDeckComponent{
        id: obstacle11
        parent: worldClassroom
        x: 1350
    }

    SmallDeckComponent{
        id: obstacle12
        parent: worldClassroom
        anchors.bottom: obstacle11.top
        anchors.left: obstacle11.left
        bodyMode: "static"
    }

    SmallDeckComponent{
        id: obstacle13
        parent: worldClassroom
        anchors.bottom: obstacle12.top
        anchors.left: obstacle12.left
        bodyMode: "static"
    }

    CeilingLightBig{
        id: obstacle31
        parent: worldClassroom
        x:1800
    }

    CeilingLightBig{
        id: obstacle32
        parent: worldClassroom
        x:2350
    }

    CeilingLightBig{
        id: obstacle33
        parent: worldClassroom
        x:3000
    }
}
