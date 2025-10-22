// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "engine.js" as Engine
import "../"
//import com.nokia.meego 1.0

Item{
    id: classroom

    //
    // this is the speed of saita
    //
    property int saitaSpeed: 180

    property int initialSaitaSpeed: 180

    //
    // the gravity value varies from [-1,-10]
    //
    property int gravity: -4

    //
    // this is a help variable holding the force being applied to the saita component on y-axes
    //
    property int force: 45

    //
    // this is the time period for the special effect default value
    //
    property double seconds_: 2.0

    //
    // the level property this will help any achievements functionality
    //
    property int level: 11

    //
    // self explanatory
    //
    property int bonusCounter: 0

    //
    // self explanatory
    //
    property bool specialEffectTimerRunning: false

    //
    // gameplay properties controling the states of the game
    //
    property bool gameFinish: false
    property bool running: false
    property bool paused: false

    //
    // helper properties used on translating the background elements
    //
//    property real backgroundLevel1OffsetValue: saitaSpeed*0.0157
    property real kvalue: saitaSpeed == 180?0.0168:0.036
    property real backgroundLevel1OffsetValue: saitaSpeed*kvalue
//    property real backgroundLevel1OffsetValue: 2.355
    property real backgroundLevel2OffsetValue: backgroundLevel1OffsetValue * 0.5
    property real backgroundLevel3OffsetValue: backgroundLevel2OffsetValue * 0.2

    //
    // helper properties used on translating the background elements
    //
    property real background1TranslateValue: 0
    property real background2TranslateValue: 0
    property real background3TranslateValue: 0

    //
    // alias properties
    //
    property alias saita: foreground.classRoomSaita

    //
    // the lId holds the level id and the bVal equals with the bonusCounter
    //
    signal lost(int lId, int bVal)

    //
    // the lId holds the level id and the bVal equals with the bonusCounter
    //
    signal win(int lId,int bVal)

    //
    // helper function
    //
    function appendToExtrasArray(extras){
        Engine.appendToExtrasArray(extras);
    }

    //
    // helper function
    //
    function restartGame(){
        // firstly reset the state
        classroom.state = ''

        // restart the game engine
        Engine.restartGame();
    }

    //
    // helper function
    //
    function stopSpecialEffect(){
        Engine.stopSpecialEffect();
    }

    //
    // helper function
    //
    function applyForce(){
        Engine.applyForce();
    }

    //
    // helper function
    //
    function hideExtrasItem(idxNo){
        Engine.hideExtrasItem(idxNo)
    }

    //
    // create tips dynamically
    //
    function createTips(){
        if(levelView.showTipsOnStart){
            var component = Qt.createComponent(Qt.resolvedUrl('Tips.qml'));

            if(component.status == Component.Ready){
                var tipsElement = component.createObject(classroom);
                tipsElement.z = 200;
            }else
                console.log(component.errorString() + ' status : ' + component.status);
        }
    }

    function doNotShowTipsOnStart(){
        levelView.showTipsOnStart = false;
    }

    //
    //
    //
    anchors.fill: parent

    //
    // this image is used on the lost state
    //
    Image{
        id: shadowImage
        anchors.fill: parent
        visible: false
        source: "../images/background/shadow_background.png"
        z: 300
    }

    //
    // this image is used on the special effect named night
    //
    Image{
        id: nightImage
        source: "images/extras/night.png"
        opacity: 0
        anchors.fill: parent
        z: 300

        Behavior on opacity{
            NumberAnimation{ duration: 300 }
        }
    }

    //
    // this is the background element containing the grid
    //
//    BackgroundLevel0{
//        id: backgroundLevel0
//        height: foreground.contentHeight
//        x: -foreground.contentX
//        transform: Translate{ x: background1TranslateValue }
//        z:3
//    }

    //
    // this is the bottom background level,its the level contains walls
    //
    BackgroundLevel1 {
        id: backgroundLevel1
//        width: foreground.contentWidth
        height: foreground.contentHeight
        transform: Translate{ x: background1TranslateValue }
        x: -foreground.contentX
        z:2
    }

    //
    // this is the intermediate background level,its the level containing trees etc..
    //
    BackgroundLevel2 {
        id: backgroundLevel2
        width: foreground.contentWidth
        height: foreground.contentHeight
        transform: Translate{ x: background2TranslateValue }
        x: -foreground.contentX
        z:1
    }

    //
    // this is the top background level , actually its the layer containing the sky
    //
    BackgroundLevel3 {
        id: backgroundLevel3
        width: foreground.contentWidth
        height: foreground.contentHeight
        transform: Translate{ x: background3TranslateValue }
        x: -foreground.contentX
    }

    //
    // PHYSICS
    // this is where the physics world items are being put in
    //
    //
    ForeGround{
        id: foreground
        contentWidth: backgroundLevel1.width
        contentHeight: 480
        anchors.fill: parent
        interactive: true
        z:4
        gravityValue: gravity
        boundsBehavior: Flickable.StopAtBounds
        _seconds: seconds_;
    }

    //
    // this is the bonus animation
    //
    BonusAnimation{
        id: bonusAnimation
        opacity: 0.0;
        z: 10;
        bonusEaten: "images/extras/apple_bitten.png"
        onFinished: bonusCounter += 1
    }

    //
    // self explanatory
    //
    BonusPanel{
        id: bonusPanel
        width: 100
        height: 20
        z:10
        bonusText: 'x' + bonusCounter
        imagePath: "images/extras/apple.png"
        visible: bonusCounter > 0? true : false
        anchors{ top: parent.top; topMargin: 40; left: parent.left; leftMargin: 6 }
    }

    StageTapAnimation{
        id: stageTapAnimation
        z:300
    }

    MouseArea{
        id: mArea
        z: 5
        enabled: false
        anchors.fill: parent

        onClicked: {
            stageTapAnimation.x = mouse.x -stageTapAnimation.width/1.5
            stageTapAnimation.y = mouse.y -stageTapAnimation.height/1.5
            stageTapAnimation.start();

            // play stage tap sound
            levelView.playStageTapSoundEffect();

            if(paused) {// check if it is not already running , if not start running

                foreground.hand.handArea.enabled = false

//                backgroundLevel0.x = backgroundLevel0.x;
                backgroundLevel1.x = backgroundLevel1.x;
                backgroundLevel2.x = backgroundLevel2.x;
                backgroundLevel3.x = backgroundLevel3.x;

                foreground.interactive = false

                // change state of arcadeCanvas item to running
                levelView.state = 'running';

                // change container state to running
                classroom.state = 'running'

                saita.state = 'running'

                // open hand
                foreground.hand.state = 'open'

                foreground.hand.y = foreground.hand.y

                if( background1TranslateValue == 0)
                    applyForce();

            }else if(classroom.running || gameFinish){

                // apply a force to the saita
                applyForce();

                saita.rotateSaita()
            }
            else if(!classroom.running && !paused){ // check if it is not already running , if not start running

                // change arcadeCanvas to state running
                levelView.state = 'running';

                // change container state to running
                classroom.state = 'running'

                //
                saita.state = 'running'

                // open hand
                foreground.hand.state = 'open'

                // apply a force to the saita
                applyForce();

                saita.rotateSaita()

                foreground.hand.y = foreground.hand.y
            }
        }
    }

    //
    //
    //
    states:[
        State{
            name: "paused"
            StateChangeScript{ name: "pauseScript";
                script: {
                    classroom.paused =true;

                    saita.active = false;
                    specialEffectTimerRunning = false;
              levelView.stopApplySpecialEffectSoundEffect();
              levelView.stopMusic();
                }
            }
            PropertyChanges { target: foreground.worldClassroom; running: false }
            PropertyChanges { target: mArea; enabled: true }
            PropertyChanges { target: classroom; running: false; }
            PropertyChanges { target: shadowImage; visible: true }
            PropertyChanges { target: foreground; interactive: false }
        },State{
            name: "lost"
            StateChangeScript{ name: "lostScript";
                script: {
                    // stop special effect
                    Engine.stopSpecialEffect();
                    // set saita to lost state
                    saita.state = 'lost'
                    // stop special effect sound effect
                    levelView.playLostSoundEffect();
                    levelView.stopMusic();

                    // enable rotatio for saita element
                    saita.fixedRotation = false;

                    classroom.lost(level,bonusCounter)

                    console.log('finished lost state change script..')

                }
            }
            PropertyChanges { target: classroom; running: false; paused: false; gameFinish:gameFinish?true:false }
            PropertyChanges { target: shadowImage; visible: true }
            PropertyChanges { target: foreground; interactive: false }
            PropertyChanges { target: mArea; enabled: false }
        },State{
            name: "running"
            StateChangeScript{ name: "myScript";
                script: {
                    classroom.paused = false;

                    saita.fixedRotation = true;
                    saita.rotation = 0;
                    saita.linearVelocity.x = saitaSpeed;

//                    foreground.collisionTimer.interval = 180

                    saita.active = true;

                    // activate the special effect timer if it was running before the pause button pushed
                    if(foreground.pb.active)
                    {
                        specialEffectTimerRunning = true;
                    }
                    else
                    {
                        specialEffectTimerRunning = false;
                    }

              levelView.playMusic();
                }
            }
            PropertyChanges { target: bonusPanel; state: 'finish' }
            PropertyChanges { target: foreground.worldClassroom; running: true }
            PropertyChanges { target: classroom; gameFinish: false; running: true }
            PropertyChanges { target: shadowImage; visible: false }
            PropertyChanges { target: foreground; interactive: false }
            PropertyChanges { target: mArea; enabled: true }
        },
        State{
            name: "win"

            StateChangeScript{ name: "winScript"; script: { levelView.stopMusic(); classroom.win(level,bonusCounter) } }

            PropertyChanges { target: foreground.worldClassroom; running: false }
            PropertyChanges { target: mArea; enabled: false }
            PropertyChanges { target: classroom; running: false; paused: false }
            PropertyChanges { target: shadowImage; visible: false }
            PropertyChanges { target: foreground; interactive: false }
        }
    ]

    Component.onCompleted: createTips()
}
