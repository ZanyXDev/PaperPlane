// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    function inActivateVisibleObstacles(){

    }

    function activateVisibleObstacles(){

    }

    MovingCeilingLight_Big{
        id: obstacle1
        x:480
        parent: worldClassroom
    }

    BasketBallComponent{
        id: obstacle2
        x:1200
        y:worldClassroom.ceilingWallHeight+150
        parent: worldClassroom
        bRestitution: 0.98
    }

    BasketBallComponent{
        id: obstacle3
        x:obstacle2.x+220
        y:worldClassroom.ceilingWallHeight+120
        parent: worldClassroom
        bRestitution: 0.97
    }

    BasketBallComponent{
        id: obstacle4
        x:obstacle3.x+220
        y:worldClassroom.ceilingWallHeight+100
        parent: worldClassroom
        bRestitution: 0.99
    }

    ResizableCeilingLight{
        id: obstacle5
        x: 2150
        parent: worldClassroom
        modeType: "dynamic"
        timerInterval: 200
    }

    ResizableCeilingLight{
        id: obstacle6
        x: 3100
        parent: worldClassroom
        modeType: "dynamic"
        timerInterval: 220
    }

    BeanComponent{
        id: obstacle7
        x:2550
        parent: worldClassroom
    }
}
