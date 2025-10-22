// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import Box2D 1.0
import "../"

Flickable{
    id: flickable

    //
    // aliases are helper properties
    //
    property alias classRoomSaita: classRoomSaita
    property alias hand: hand
    property alias worldClassroom: worldClassroom
    property alias pb: pb
    property alias obstacles: obstacles

    property double _seconds: 2.5

    //
    // self explanatory
    //
    property int gravityValue: -4

    //
    // focus on the saita , the saita should be always on certain x position , in terms of the device screen positioning..
    //
    contentX: classRoomSaita.x > classroom.width / 5? classRoomSaita.currentCenterX : 0

    //
    // helper property
    //
    property int offsetLimit: classroom.width - worldClassroom.width

    //
    // helper function
    //
    function inActivateVisibleObstacles(){
        obstacles.inActivateVisibleObstacles();
    }

    //
    // helper function
    //
    function activateVisibleObstacles(){
        obstacles.activateVisibleObstacles();
    }

    //
    // a hand!
    //
    Hand{
        id: hand
        x:mapToItem(worldClassroom,0,hand.y).x
        y: classRoomSaita.y+classRoomSaita.height+18
        width: 80
        height: 70
        z:200

        property int initialY: 0
        property int saitaInitialY: 0

        MouseArea{
            id: handArea
            anchors.margins: -20
            anchors.fill: parent

            onPressed: {
                foreground.interactive = false
//                backgroundLevel0.x = 0;
                backgroundLevel1.x = 0;
                backgroundLevel2.x = 0;
                backgroundLevel3.x = 0;

                hand.initialY = mapToItem(foreground,mouse.x,mouse.y).y;
                hand.saitaInitialY = saita.y;
            }

            onPositionChanged: {
                foreground.interactive = false;
                var diffY = hand.initialY - mapToItem(foreground,mouse.x,mouse.y).y;
                if(!classroom.running && !paused && mapToItem(foreground,mouse.x,mouse.y).y > 100 && mapToItem(foreground,mouse.x,mouse.y).y < (worldClassroom.height - worldClassroom.floorWallHeight-hand.height/2)){
                    saita.y = hand.saitaInitialY - diffY;
                }
            }

            onReleased: {

                handArea.enabled = false
                mArea.enabled = true;

                // change arcadeCanvas to state running
                levelView.state = 'running';

                // change container state to running
                classroom.state = 'running'

                //
                classRoomSaita.state = 'running'

                // open hand
                hand.state = 'open'

                // apply a force to the saita
                applyForce();

                saita.rotateSaita()

                hand.y = hand.y
            }
        }
    }

    //
    // PHYSICS WORLD
    //
    World {
        id: worldClassroom

        //
        // this is the y of the floor elements
        //
        property int floorY: height - floorWallHeight
        property int floorWallHeight: 31

        //
        //this is the y coordinate of the roof elements
        //
        property int ceilingY: ceilingWallHeight;
        property int ceilingWallHeight: 31

        //
        //
        //
        gravity: Qt.point(0,gravityValue)

        //
        //
        //
        width: flickable.contentWidth
        height: flickable.contentHeight

        //
        // this slot is called when a collision is detected with saita and an extras element
        onExtrasContact:{
            if(classroom.state === 'lost')
                return;

            console.log('extras indexNo : ' + idxNo)
            //
            hideExtrasItem(idxNo);
        }

        //
        // This item holds all the obstacles belong on this level
        //
        Obstacles{
            id: obstacles
        }

        //
        // BONUS ITEMS
        //
        ExtrasFrame{
            id: extrasFrame
            z:201
        }

        //
        // this is the main character
        //
        Saita{
            id: classRoomSaita
            z: 200

            // check if the x coordinate has changed, of yes update as necessary
            onXChanged: {
//                // check if the game is running
                if(classroom.running && !classroom.gameFinish){
                    if(contentX == 0)
                        return;

                    background1TranslateValue -= classroom.backgroundLevel1OffsetValue;
                    background2TranslateValue -= classroom.backgroundLevel2OffsetValue;
                    background3TranslateValue -= classroom.backgroundLevel3OffsetValue;

                    if(background1TranslateValue < offsetLimit+3.1)
                        classroom.gameFinish = true;
                }else{

                    var offsetX1 = classroom.mapToItem(backgroundLevel1,classroom.width,0).x+3.15;

                    if(offsetX1 > flickable.contentWidth){
                        var val = flickable.contentX;
                        flickable.contentX = val;

                        var saitaOffsetX = worldClassroom.mapToItem(classroom,classRoomSaita.x,0).x-3.15;

                        if(saitaOffsetX > classroom.width && classroom.state === 'running')
                        {
                            classroom.state = 'win'

                            levelView.state = 'win'
                        }
                    }
                }
            }

            onContactWithObstacles: {
                if(classroom.state != 'running')
                    return;

                classroom.state = 'lost';

                // change arcadeCanvas state to lost
                levelView.state = 'lost'
            }
        }

        //
        // This is the progress bar shown when a special effect is active
        MyProgressBar{
            id: pb
            mPBRunning: specialEffectTimerRunning
            seconds: _seconds;
            visible: specialEffectTimerRunning
            width: saita.width/1.5
            height: 10
            anchors.horizontalCenter: saita.horizontalCenter
            anchors.bottom: saita.top
            anchors.bottomMargin: 4
            z:201

            onFinished: classroom.stopSpecialEffect();
        }

        //
        // FLOOR ITEM
        //
        Wall{
            id: floor
            height: worldClassroom.floorWallHeight
            width: parent.width
            anchors.bottom: parent.bottom
        }

        //
        // CEILING ITEM
        //
        Wall{
            id: ceiling
            height: worldClassroom.ceilingWallHeight
            width: parent.width
            anchors.top: parent.top
        }
    }
}
