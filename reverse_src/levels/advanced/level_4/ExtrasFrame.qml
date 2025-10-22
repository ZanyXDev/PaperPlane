// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: 400
        y: worldClassroom.ceilingWallHeight + 20
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: 1665
        y: worldClassroom.height-worldClassroom.floorWallHeight-bonus2.height
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: 2600
        y:60
        parent: worldClassroom
        indexNo: 3
    }

    SpecialEffectBullet{
        id: specialEffect1
        x: 800
        y: 395
        parent: worldClassroom
        indexNo: 11
        seconds: 2.5
        speedIncreaseProportion: 1.35
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(specialEffect1);
    }
}
