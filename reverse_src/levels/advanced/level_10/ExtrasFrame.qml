// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    SpecialEffectSlowDown{
        id: specialeffect1
        parent: worldClassroom
        x: obstacles.firstObstacleX
        y: worldClassroom.height/2
        seconds: 2.5
        indexNo: 4
    }

    SpecialEffectScissor{
        id: specialeffect2
        parent: worldClassroom
        anchors.left: specialeffect1.right
        anchors.leftMargin: width/2
        y: worldClassroom.ceilingWallHeight + height
        indexNo: 5
    }

    SpecialEffectStealth{
        id: specialeffect3
        parent: worldClassroom
        x: obstacles.firstSlotX
        y: worldClassroom.height - worldClassroom.floorWallHeight - 1.4*height
        indexNo: 6
        seconds: 2.0
    }

    Bonus{
        id: bonus1
        x: obstacles.secondCeilingX
        y: worldClassroom.ceilingWallHeight + height
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: obstacles.firstChairX - 2*obstacles.firnitureSpacing
        y: worldClassroom.height - worldClassroom.floorWallHeight - height*2.5
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: obstacles.secondSlotX
        y: worldClassroom.height - worldClassroom.floorWallHeight - height*1.8
        parent: worldClassroom
        indexNo: 3
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(specialeffect1);
        appendToExtrasArray(specialeffect2);
        appendToExtrasArray(specialeffect3);
    }
}
