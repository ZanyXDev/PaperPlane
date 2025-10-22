// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: obstacles.emptySpaceX
        y: worldClassroom.height - worldClassroom.floorWallHeight - bonus1.height - 10
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: obstacles.deskEndX + obstacles.deskSpacing
        y: worldClassroom.height - worldClassroom.floorWallHeight - height - 10
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: worldClassroom.width - 4*obstacles.deskSpacing
        y:worldClassroom.height/5
        parent: worldClassroom
        indexNo: 3
    }

    SpecialEffectStealth{
        id: specialeffect1
        x: obstacles.deskStartX - 20
        y: worldClassroom.height - worldClassroom.floorWallHeight - bonus1.height - 10
        seconds: 4.5
        parent: worldClassroom
        indexNo: 4
    }

    SpecialEffectStealth{
        id: specialeffect2
        x: obstacles.emptySpaceX + obstacles.deskSpacing
        y: worldClassroom.height - worldClassroom.floorWallHeight - height - 10
        seconds: 4.7
        parent: worldClassroom
        indexNo: 5
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(specialeffect1);
        appendToExtrasArray(specialeffect2);
    }
}
