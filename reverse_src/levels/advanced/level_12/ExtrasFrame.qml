// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    SpecialEffectStealthAlt{
        id: specialeffect1
        parent: worldClassroom
        x: obstacles.firstObstacleX
        y: worldClassroom.ceilingWallHeight
        indexNo: 4
        seconds: 2.5
    }

    SpecialEffectStealth{
        id: specialeffect2
        parent: worldClassroom
        x: obstacles.deckGroupStartX - obstacles.firnitureSpacing/2
        y: worldClassroom.height - worldClassroom.floorWallHeight - height*1.5
        indexNo: 5
        seconds: 3.45
    }

    Bonus{
        id: bonus1
        x: obstacles.chairEndX
        y: worldClassroom.ceilingWallHeight + 2*height
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        anchors.left: bonus1.right
        anchors.leftMargin: obstacles.firnitureSpacing*3
        y: worldClassroom.height/3
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: obstacles.obstaclesEndX
        y: worldClassroom.height - worldClassroom.floorWallHeight - height*2
        parent: worldClassroom
        indexNo: 3
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(specialeffect1);
        appendToExtrasArray(specialeffect2);
    }
}
