// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    function inActivateVisibleObstacles(){

    }

    function activateVisibleObstacles(){

    }

    CustomCeilingLight{
        id: obstacle1
        x:480
        cableHeight: 20
        parent: worldClassroom
    }

    SmallChairComponent{
        id: obstacle2
        anchors.horizontalCenter: obstacle1.horizontalCenter
        parent: worldClassroom
    }

    BasketBallComponent{
        id: obstacle3
        x:1350
        y:worldClassroom.ceilingWallHeight+100
        parent: worldClassroom
        bRestitution: 0.98
        initialLinearVelocity: Qt.point(-90,-40)
    }

    BasketBallComponent{
        id: obstacle4
        x:obstacle3.x+250
        y:worldClassroom.ceilingWallHeight+50
        parent: worldClassroom
        bRestitution: 0.97
        initialLinearVelocity: Qt.point(-80,-20)
    }

    BasketBallComponent{
        id: obstacle5
        x:obstacle4.x+600
        y:worldClassroom.height/2
        parent: worldClassroom
        bRestitution: 0.99
        initialLinearVelocity: Qt.point(-80,-200)
    }

    BasketBallComponent{
        id: obstacle6
        x:obstacle5.x+150
        y:worldClassroom.height/2
        parent: worldClassroom
        bRestitution: 0.99
        initialLinearVelocity: Qt.point(-80,-200)
    }

    BasketBallComponent{
        id: obstacle7
        x:obstacle6.x+150
        y:worldClassroom.height/2
        parent: worldClassroom
        bRestitution: 0.99
        initialLinearVelocity: Qt.point(-80,-200)
    }

    BasketBallComponent{
        id: obstacle8
        x:obstacle7.x+150
        y:worldClassroom.height/2
        parent: worldClassroom
        bRestitution: 0.99
        initialLinearVelocity: Qt.point(-80,-200)
    }

    BasketBallComponent{
        id: obstacle9
        x:obstacle8.x+300
        y:worldClassroom.height/4
        parent: worldClassroom
        bRestitution: 0.99
        initialLinearVelocity: Qt.point(-90,-30)
    }

    BasketBallComponent{
        id: obstacle10
        x:obstacle9.x+100
        y:worldClassroom.height/3
        parent: worldClassroom
        bRestitution: 0.99
        initialLinearVelocity: Qt.point(-50,-30)
    }

//    BasketBallComponent{
//        id: obstacle11
//        x:obstacle10.x+150
//        y:worldClassroom.height/2
//        parent: worldClassroom
//        bRestitution: 0.99
//        initialLinearVelocity: Qt.point(-80,-200)
//    }

    ResizableCeilingLight{
        id: obstacle12
        x: worldClassroom.width - 854 / 2.5
        parent: worldClassroom
        timerInterval: 190
    }

//    BeanComponent{
//        id: obstacle7
//        x:2550
//        parent: worldClassroom
//    }
}
