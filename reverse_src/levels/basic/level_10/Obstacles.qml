// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    property int spacing: 200

    property variant firstBonusPos: Qt.point(obstacle2.x+obstacle2.width+spacing,worldClassroom.height/2)
    property variant secondBonusPos: Qt.point(obstacle5.x - spacing,worldClassroom.height/3.5)
    property variant thirdBonusPos: Qt.point(obstacle6.x-spacing/1.8,worldClassroom.height-worldClassroom.ceilingWallHeight-spacing/4.2)

    BeanComponent{
        id: obstacle1
        x: spacing*2
        parent: worldClassroom
    }

    MovingCeilingLight_Big{
        id: obstacle2
        anchors.left: obstacle1.right
        anchors.leftMargin: spacing/1.2
        parent: worldClassroom
    }

    BigDeckComponent{
        id: obstacle3
        anchors.left: obstacle2.right
        anchors.leftMargin: 1.92*spacing
        parent: worldClassroom
    }

    BigDeckComponent{
        id: obstacle4
        anchors.left: obstacle3.right
        anchors.leftMargin: 1.92*spacing
        parent: worldClassroom
    }

    BigDeckComponent{
        id: obstacle5
        anchors.left: obstacle4.right
        anchors.leftMargin: 1.92*spacing
        parent: worldClassroom
    }

    BigDeckComponent{
        id: obstacle6
        anchors.left: obstacle5.right
        anchors.leftMargin: 1.8*spacing
        parent: worldClassroom
    }
}
