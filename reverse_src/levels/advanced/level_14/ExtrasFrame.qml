// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "extras"

Item {

    Bonus{
        id: bonus1
        x: obstacles.firstSlotX
        y: worldClassroom.height/1.5
        parent: worldClassroom
        indexNo: 1
    }

    Bonus{
        id: bonus2
        x: obstacles.resizableLightGroupEndX+obstacles.obstaclesSpacing*1.3
        y: worldClassroom.ceilingWallHeight + obstacles.obstaclesSpacing/5
        parent: worldClassroom
        indexNo: 2
    }

    Bonus{
        id: bonus3
        x: obstacles.ballGroupMiddleX
        y: worldClassroom.height - worldClassroom.floorWallHeight - height - obstacles.obstaclesSpacing/5
        parent: worldClassroom
        indexNo: 3
    }

    SpecialEffectSrink{
        id: specialeffect1
        parent: worldClassroom
        x: obstacles.ballGroupEndX+obstacles.obstaclesSpacing/2
        y: worldClassroom.height - worldClassroom.floorWallHeight - height - obstacles.obstaclesSpacing/5
        indexNo: 4
        seconds: 9.2
    }

    SpecialEffectSlowDown{
        id: specialeffect2
        parent: worldClassroom
        x: obstacles.resizableLightGroupEndX+obstacles.obstaclesSpacing/3
        y: worldClassroom.height/1.5
        indexNo: 5
        seconds: 4.5
    }

//    SpecialEffectSrink{
//        id: specialeffect2
//        parent: worldClassroom
//        x: obstacles.deskEndX + obstacles.furnitureSpacing
//        y: worldClassroom.height/1.5
//        indexNo: 5
//        seconds: 5.5
//    }

//    SpecialEffectStealth{
//        id: specialeffect3
//        parent: worldClassroom
//        x: obstacles.deskX
//        y: worldClassroom.height - worldClassroom.floorWallHeight - height - obstacles.furnitureSpacing/5
//        indexNo: 6
//        seconds: 1.0
//    }

    Component.onCompleted: {
        appendToExtrasArray(bonus1);
        appendToExtrasArray(bonus2);
        appendToExtrasArray(bonus3);
        appendToExtrasArray(specialeffect1);
        appendToExtrasArray(specialeffect2);
//        appendToExtrasArray(specialeffect3);
    }
}
