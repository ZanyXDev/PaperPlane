// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property alias deskStartX: obstacle1.x

    property int emptySpaceX: obstacle4.x - 90

    property int deskEndX: obstacle6.x + obstacle6.width

    property int deskSpacing: 50

    function inActivateVisibleObstacles(){
        obstacle1.state = 'inActive'
        obstacle2.state = 'inActive'
        obstacle3.state = 'inActive'
        obstacle4.state = 'inActive'
        obstacle5.state = 'inActive'
        obstacle6.state = 'inActive'
    }

    function activateVisibleObstacles(){
        obstacle1.state = 'active'
        obstacle2.state = 'active'
        obstacle3.state = 'active'
        obstacle4.state = 'active'
        obstacle5.state = 'active'
        obstacle6.state = 'active'
    }

    DeskComponent{
        id: obstacle1
        x: 700
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: deskSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: deskSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 2*deskSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: deskSpacing
        parent: worldClassroom
    }

    DeskComponent{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: deskSpacing
        parent: worldClassroom
    }

    VeryBigDeckComponent{
        id: obstacle7
        parent: worldClassroom
        anchors.left: obstacle6.right
        anchors.leftMargin: 7*deskSpacing
    }

    SmallDeckComponent{
        id: obstacle8
        parent: worldClassroom
        anchors.bottom: obstacle7.top
        anchors.left: obstacle7.left
        bodyMode: "static"
    }

    SmallDeckComponent{
        id: obstacle9
        parent: worldClassroom
        anchors.bottom: obstacle8.top
        anchors.left: obstacle8.left
        bodyMode: "static"
    }

    MovingCeilingLight_Small{
        id: obstacle11
        anchors.right: obstacle1.left
        anchors.rightMargin: deskSpacing
        parent: worldClassroom
    }

    MovingCeilingLight_Small{
        id: obstacle12
        x: emptySpaceX
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle13
        parent: worldClassroom
        anchors.left: obstacle8.right
        anchors.leftMargin: 7.5*deskSpacing
        cableHeight: 4*deskSpacing
    }
}
