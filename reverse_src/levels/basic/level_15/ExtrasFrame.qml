// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: obstacles.firstBonusPos.x
        y: obstacles.firstBonusPos.y
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: obstacles.secondBonusPos.x
        y: obstacles.secondBonusPos.y
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: obstacles.thirdBonusPos.x
        y: obstacles.thirdBonusPos.y
        parent: worldClassroom
        indexNo: 3
    }

    SpecialEffectStealth{
        id: effect1
        x: obstacles.effect1Pos.x
        y: obstacles.effect1Pos.y
        parent: worldClassroom
        indexNo: 4
        seconds: 3.6
    }

    SpecialEffectStealth{
        id: effect2
        x: obstacles.effect2Pos.x
        y: obstacles.effect2Pos.y
        parent: worldClassroom
        indexNo: 5
        seconds: 6
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(effect1);
        appendToExtrasArray(effect2);
    }
}
