// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: 650
        y: worldClassroom.ceilingWallHeight + 20
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: 1800
        y: worldClassroom.height / 4
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: 2900
        y:worldClassroom.height-worldClassroom.floorWallHeight-height - 50
        parent: worldClassroom
        indexNo: 3
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
    }
}
