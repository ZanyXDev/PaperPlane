// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: obstacles.lampStartX + ((obstacles.lampEndX - obstacles.lampStartX)/2)
        y: worldClassroom.height - worldClassroom.floorWallHeight - height - 10
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: obstacles.fallingLampEndX + 20
        y: worldClassroom.ceilingWallHeight + worldClassroom.height/10
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: obstacles.obstaclesEndX + obstacles.lampSpacing
        y: worldClassroom.height - worldClassroom.floorWallHeight - height - 10
        parent: worldClassroom
        indexNo: 3
    }

    SpecialEffectBullet{
        id: specialeffect1
        x: obstacles.lampStartX - (3*obstacles.lampSpacing)
        y:worldClassroom.ceilingWallHeight + 10
        parent: worldClassroom
        speedIncreaseProportion: 1.35
        indexNo: 4
        seconds: 5.0
    }

    SpecialEffectScissor{
        id: specialeffect2
        x: obstacles.lampEndX + (obstacles.lampSpacing*1.1)
        y: worldClassroom.ceilingWallHeight + obstacles.lampSpacing/2
        parent: worldClassroom
        indexNo: 5
        indexTarget: 1
    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(specialeffect1);
        appendToExtrasArray(specialeffect2);
    }
}
