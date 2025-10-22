// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "obstacles"

Item {

    function cutFirstCeilingLight(){
        scissorAnimation.x = obstacle2.x + obstacle2.width/2 - obstacle2.cableWidth
        scissorAnimation.y = worldClassroom.ceilingWallHeight+ 5

        scissorAnimation.show()
    }

    function cutSecondCeilingLight(){
        scissorAnimation2.x = obstacle5.x + obstacle5.width/2 - obstacle5.cableWidth
        scissorAnimation2.y = worldClassroom.ceilingWallHeight+ 5

        scissorAnimation2.show()
    }

    //
    // this is the scissors animation
    //
    ScissorAnimation{
        id: scissorAnimation
        parent: worldClassroom
    }

    //
    // this is the scissors animation
    //
    ScissorAnimation{
        id: scissorAnimation2
        parent: worldClassroom
    }

    Connections{
        target: scissorAnimation
        onFinished: obstacle2.state = 'fall'
    }

    Connections{
        target: scissorAnimation2
        onFinished: obstacle5.state = 'fall'
    }

    CustomCeilingLight{
        id: obstacle1
        x: 500
        cableHeight: 150
        parent: worldClassroom
    }

    FallingCeilingLight{
        id: obstacle2
        x:1250
        parent: worldClassroom
    }

    BigDeckComponent{
        id: obstacle3
        x: 1800
        parent: worldClassroom
    }

    CustomCeilingLight{
        id: obstacle4
        x: 2000
        parent: worldClassroom
        cableHeight: 200
    }

    FallingCeilingLight{
        id: obstacle5
        x:2800
        parent: worldClassroom
        cableHeight: 200
    }
}
