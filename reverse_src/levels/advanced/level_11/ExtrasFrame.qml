// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: obstacles.secondChairX - (obstacles.firnitureSpacing*2)
        y: worldClassroom.height - worldClassroom.floorWallHeight - height - 10
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: obstacles.fifthChairX - (obstacles.firnitureSpacing*2)
        y: worldClassroom.height - worldClassroom.floorWallHeight - height - 10
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: obstacles.lastObstacleX
        y: worldClassroom.ceilingWallHeight + height
        parent: worldClassroom
        indexNo: 3
    }

    SpecialEffectSlowDown{
        id: specialeffect1
        parent: worldClassroom
        x: obstacles.firstDeskX - (1.5*obstacles.firnitureSpacing)
        y: worldClassroom.ceilingWallHeight + 12
        indexNo: 4
        seconds: 4
    }

    SpecialEffectSlowDown{
        id: specialeffect2
        parent: worldClassroom
        x: obstacles.forthDeskX - (1.5*obstacles.firnitureSpacing)
        y: worldClassroom.ceilingWallHeight + 12
        indexNo: 5
        seconds: 4
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(specialeffect1);
        appendToExtrasArray(specialeffect2);
    }
}
