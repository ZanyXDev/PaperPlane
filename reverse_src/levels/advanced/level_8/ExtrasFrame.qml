// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    SpecialEffectStealth{
        id: specialeffect1
        parent: worldClassroom
        x: obstacles.firstSlotX
        y: worldClassroom.height - worldClassroom.floorWallHeight - 1.4*height
        indexNo: 4
        seconds: 5.8
    }

    PenaltyEffectNight{
        id: specialeffect2
        parent: worldClassroom
        anchors.left: specialeffect1.right
        anchors.leftMargin: obstacles.firnitureSpacing*2
        y: worldClassroom.height/2
        indexNo: 5
        seconds: 7
    }

    PenaltyEffectNight{
        id: specialeffect3
        parent: worldClassroom
        anchors.left: specialeffect2.right
        anchors.leftMargin: obstacles.firnitureSpacing*2
        y: worldClassroom.height/6
        indexNo: 6
        seconds: 6
    }

    PenaltyEffectNight{
        id: specialeffect4
        parent: worldClassroom
        anchors.left: specialeffect3.right
        anchors.leftMargin: obstacles.firnitureSpacing*2
        y: worldClassroom.height/2
        indexNo: 7
        seconds: 5
    }

    PenaltyEffectNight{
        id: specialeffect5
        parent: worldClassroom
        anchors.left: specialeffect4.right
        anchors.leftMargin: obstacles.firnitureSpacing*2
        y: worldClassroom.height/5
        indexNo: 8
        seconds: 5
    }

    PenaltyEffectNight{
        id: specialeffect6
        parent: worldClassroom
        anchors.left: specialeffect5.right
        anchors.leftMargin: obstacles.firnitureSpacing
        y: worldClassroom.height/1.5
        indexNo: 9
        seconds: 5
    }

    PenaltyEffectNight{
        id: specialeffect7
        parent: worldClassroom
        anchors.left: specialeffect6.right
        anchors.leftMargin: obstacles.firnitureSpacing
        y: worldClassroom.height/2
        indexNo: 9
        seconds: 5
    }

    PenaltyEffectNight{
        id: specialeffect8
        parent: worldClassroom
        anchors.left: specialeffect7.right
        anchors.leftMargin: obstacles.firnitureSpacing
        y: worldClassroom.height/3
        indexNo: 9
        seconds: 5
    }

    Bonus{
        id: bonus1
        x: obstacles.secondSlotX
        y: worldClassroom.height - worldClassroom.floorWallHeight - height*1.8
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: obstacles.lastDeskX
        y: worldClassroom.height - worldClassroom.floorWallHeight - height*1.8
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: worldClassroom.width - obstacles.firnitureSpacing*7
        y: worldClassroom.height/3
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
        appendToExtrasArray(specialeffect6);
        appendToExtrasArray(specialeffect7);
        appendToExtrasArray(specialeffect8);
    }
}
