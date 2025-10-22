// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: 1350
        y: worldClassroom.ceilingWallHeight + 20
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: 2300
        y: worldClassroom.height /2.5
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: 3000
        y:worldClassroom.ceilingWallHeight + 25
        parent: worldClassroom
        indexNo: 3
    }

    SpecialEffectScissor{
        id: specialEffectScissor
        x: 800
        y: worldClassroom.ceilingWallHeight + 5
        parent: worldClassroom
        indexTarget: 1
        indexNo: 4
    }

    SpecialEffectScissor{
        id: specialEffectScissor2
        x: bonus2.x + 100
        y: bonus2.y - 50
        parent: worldClassroom
        indexTarget: 2
        indexNo: 5
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(specialEffectScissor);
        appendToExtrasArray(specialEffectScissor2);
    }
}
