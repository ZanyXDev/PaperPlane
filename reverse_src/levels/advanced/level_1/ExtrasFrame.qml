// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: 1050
        y: 370
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: 1700
        y: 370
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: 2700
        y:foreground.worldClassroom.ceilingWallHeight + 40
        parent: worldClassroom
        indexNo: 3
    }

    SpecialEffectStealth{
        id: specialEffect1
        x: 630
        y:380
        parent: worldClassroom
        indexNo: 4
        seconds: 2.5
    }

    SpecialEffectStealth{
        id: specialEffect2
        x: 2050
        y:foreground.worldClassroom.ceilingWallHeight + 10
        parent: worldClassroom
        indexNo: 5
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
//        appendToExtrasArray(nightPenaltyEffect);
        appendToExtrasArray(specialEffect1);
        appendToExtrasArray(specialEffect2);
    }
}
