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

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
    }
}
