// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    SpecialEffectScissor{
        id: specialeffect1
        parent: worldClassroom
        x: obstacles.firstSlotX
        y: worldClassroom.ceilingWallHeight + 3*height
        indexNo: 4
    }

    PenaltyEffectNight{
        id: specialeffect2
        parent: worldClassroom
        x: obstacles.movingLampX
        y: worldClassroom.height - worldClassroom.floorWallHeight - 1.5*height
        indexNo: 5
        seconds: 7
    }

    PenaltyEffectNight{
        id: specialeffect3
        parent: worldClassroom
        x: obstacles.movingLampEnd
        y: worldClassroom.height/2
        indexNo: 6
        seconds: 7
    }

    PenaltyEffectNight{
        id: specialeffect4
        parent: worldClassroom
        anchors.left: specialeffect3.right
        anchors.leftMargin: obstacles.firnitureSpacing
        y: worldClassroom.height/4
        indexNo: 7
        seconds: 6
    }

    PenaltyEffectNight{
        id: specialeffect5
        parent: worldClassroom
        anchors.left: specialeffect4.right
        anchors.leftMargin: obstacles.firnitureSpacing
        y: worldClassroom.height/3
        indexNo: 8
        seconds: 5
    }

    Bonus{
        id: bonus1
        x: obstacles.secondSlotX
        y: worldClassroom.ceilingWallHeight + height
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        anchors.left: specialeffect4.left
        anchors.top: specialeffect4.bottom
        anchors.topMargin: obstacles.firnitureSpacing/5
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: worldClassroom.width - obstacles.firnitureSpacing*5
        y: worldClassroom.height/2
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
        appendToExtrasArray(specialeffect4);
        appendToExtrasArray(specialeffect5);
    }
}
