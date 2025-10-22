// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {
    property int obstaclesSpacing: 100

    property int ballGroupEndX: obstacle3.x+obstacle3.width

    property alias ballGroupMiddleX: obstacle1.x

    property int chairLightComboEndX: obstacle5.x+obstacle5.width

    property int firtSpotX: worldClassroom.width - obstaclesSpacing*8

    BasketBallComponent{
        id: obstacle
        parent: worldClassroom
        x: 6*obstaclesSpacing
        y: worldClassroom.height/1.5
        bRestitution: 0.97
        initialLinearVelocity: Qt.point(0,260)
    }

    BasketBallComponent{
        id: obstacle0
        parent: worldClassroom
        anchors.left: obstacle.right
        anchors.leftMargin: obstaclesSpacing
        y: worldClassroom.height/2
        bRestitution: 0.98
        initialLinearVelocity: Qt.point(0,200)
    }

    BasketBallComponent{
        id: obstacle1
        parent: worldClassroom
        anchors.left: obstacle0.right
        anchors.leftMargin: obstaclesSpacing
        y: worldClassroom.height/6
        bRestitution: 0.97
    }

    BasketBallComponent{
        id: obstacle2
        parent: worldClassroom
        anchors.left: obstacle1.right
        anchors.leftMargin: obstaclesSpacing
        y: worldClassroom.height/4.5
        bRestitution: 0.98
    }

    BasketBallComponent{
        id: obstacle3
        parent: worldClassroom
        anchors.left: obstacle2.right
        anchors.leftMargin: obstaclesSpacing
        y:worldClassroom.height/5
        bRestitution: 0.99
    }

    CustomCeilingLight{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 3*obstaclesSpacing
        parent: worldClassroom
        cableHeight: 20
    }

    BigChairComponent{
        id: obstacle5
        anchors.horizontalCenter: obstacle4.horizontalCenter
        parent: worldClassroom
    }
}
