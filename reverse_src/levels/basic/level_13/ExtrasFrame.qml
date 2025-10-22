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

    PenaltyEffectNight{
        id: effect1
        x: 1.5*obstacles.spacing
        y: worldClassroom.height/4
        parent: worldClassroom
        indexNo: 4
        seconds: 10.0
    }

    PenaltyEffectNight{
        id: effect2
        anchors.left: effect1.right
        anchors.leftMargin: obstacles.spacing
        y: worldClassroom.height/1.4
        parent: worldClassroom
        indexNo: 5
        seconds: 10.0
    }

    PenaltyEffectNight{
        id: effect3
        anchors.left: effect2.right
        anchors.leftMargin: obstacles.spacing
        y: worldClassroom.height/3.2
        parent: worldClassroom
        indexNo: 6
        seconds: 10.0
    }

    PenaltyEffectNight{
        id: effect4
        anchors.left: effect3.right
        anchors.leftMargin: obstacles.spacing
        y: worldClassroom.height/2
        parent: worldClassroom
        indexNo: 7
        seconds: 10.0
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(effect1);
        appendToExtrasArray(effect2);
        appendToExtrasArray(effect3);
        appendToExtrasArray(effect4);
    }
}
