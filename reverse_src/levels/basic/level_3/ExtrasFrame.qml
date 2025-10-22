// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: obstacles.spacing*3
        y: worldClassroom.height/2
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        anchors.left: bonus1.right
        anchors.leftMargin: obstacles.spacing*3
        y: worldClassroom.ceilingWallHeight
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        anchors.left: bonus2.right
        anchors.leftMargin: obstacles.spacing*5
        y: worldClassroom.height-worldClassroom.floorWallHeight-height
        parent: worldClassroom
        indexNo: 3
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
    }
}
