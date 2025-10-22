/****************************************************************************
**
** This file is part of Glinder adventures
**
** Copyright (c) 2011 Nikolaos Gerontidis.
** All rights reserved.
** Contact:  Nikolaos Gerontidis (n.gerontidis@idealapps.gr)
**
** You may use this file under the terms of the license as follows:
**
** Redistribution in source and binary forms, with or without
** modification, are prohibitted without prior written permission by
** Nikolaos Gerontidis.
**
****************************************************************************/

//
// here are declared the types of all the available extras components
//
var EXTRAS_TYPE_STEALTH = 1;
var EXTRAS_TYPE_BULLET = 2;
var EXTRAS_TYPE_ZEROGRAVITY = 3;
var EXTRAS_TYPE_SCISSOR = 5;
var EXTRAS_TYPE_SLOWDOWN = 6;
var EXTRAS_TYPE_STEALTHALT = 7;
var EXTRAS_TYPE_SRINK = 8;
var EXTRAS_TYPE_BONUS = 11;
var EXTRAS_TYPE_NIGHT = 21;

//
// an array to hold dynamically created saita element
//
var saitasArray = new Array();
var helperCounter = 1;

//
// an array to store all the extra item created in this level
//
var extrasArray  = new Array();

//
// a help variable used on detecting the different types of special effect elements used on this level
//
var specialeffecttype = ''

//
// set the linear velocity on axes x of saita component equal to the speed value
//
function setSaitaSpeed(speed){
    saita.linearVelocity = Qt.point(speed,saita.linearVelocity.y);
}

//
// just append the extras component to the extrasArray array
//
function appendToExtrasArray(extras){
    extrasArray.push(extras)
}

//
// This function is called when saita bounding box collides with a bonus element
//
function appendBonus(bonus){

    var path                = bonus.source;
    var bonusType           = bonus.extrasType;

    // grab the bonus coordinates
    bonusAnimation.x = arcadeCanvas.mapFromItem(foreground.worldClassroom,bonus.x,bonus.y).x;
    bonusAnimation.y = arcadeCanvas.mapFromItem(foreground.worldClassroom,bonus.x,bonus.y).y;

    // reset bonus properties and destroy object
    bonus.visible           = false;
    bonus.source            = ""
    bonus.destroy();

    // start bonus score animation
    bonusAnimation.show();
}

//
// apply a force towards the possitive y-axes in order to lift the saita
//
function applyForce(){

    // get the velocity towards the y-axes
    var linearYVelocity = saita.linearVelocity.y;

    if(linearYVelocity > 50) {// check whether the glinder has a velocity greater than 50..
        saita.applyLinearImpulse(Qt.point(0,-force),Qt.point(saita.x + saita.width/2,saita.y+saita.height/2));
    }
    else if(linearYVelocity <= 50 && linearYVelocity > - 50){ // if the linear velocity towards the y axes is less than zero, then apply only one third of the original impulse
        // apply less linear than normal impulse
        saita.applyLinearImpulse(Qt.point(0,-force/1.5),Qt.point(saita.x + saita.width/2,saita.y+saita.height/2));
    }
    else{
        // apply less linear than normal impulse
        saita.applyLinearImpulse(Qt.point(0,-force/3),Qt.point(saita.x + saita.width/2,saita.y+saita.height/2));
    }
}

//
// apply slow down effect
//
function applySlowDownEffect(specialeffect){
    // set the timer to false
    specialEffectTimerRunning  = false;

    saita.proportion = specialeffect.speedIncreaseProportion
    saita.state = 'slowDown'
    saitaSpeed = saita.linearVelocity.x*specialeffect.speedIncreaseProportion*specialeffect.speedIncreaseProportion

    levelView.playBulletSoundEffect();

    console.log('specialeffect.seconds : ' + specialeffect.seconds)

    foreground.pb.seconds = specialeffect.seconds;

    // reset the progressbar value
    foreground.pb.reset();
    // start the simple timer
    specialEffectTimerRunning  = true;
}

//
// apply scissors effect
//
function applyScissorEffect(specialeffect){
    // set the timer to false
    specialEffectTimerRunning  = false;

    foreground.obstacles.cutCeilingLight();
}

//
// applies all the functionality of the srink effect
//
function applySrinkEffect(specialeffect){
    console.log('applying srink effect ..')

    specialEffectTimerRunning = false;

    //
    saita.state = 'srink'

    force = force / 4.5;

    foreground.pb.seconds = specialeffect.seconds;

    foreground.pb.reset();

    levelView.playSrinkSoundEffect();

    specialEffectTimerRunning = true;

}

//
// applies all the functionality of the stealth effect
//
function applyStealthEffect(specialeffect){
    // set the timer to false
    specialEffectTimerRunning  = false;

    // inactivate visible objects
    inActivateVisibleObstacles();

    gravity = 0
    saita.linearVelocity = Qt.point(saita.linearVelocity.x,0);

    saita.state = 'stealth'

    console.log('specialeffect.seconds : ' + specialeffect.seconds)

    foreground.pb.seconds = specialeffect.seconds;

    levelView.playStealthSoundEffect();

    // reset the progressbar value
    foreground.pb.reset();
    // start the simple timer
    specialEffectTimerRunning  = true;
}

function applyAltStealthEffect(specialeffect){
    // set the timer to false
    specialEffectTimerRunning  = false;

    // inactivate visible objects
    inActivateSaitasArrayElements();

    saita.state = 'stealth'

    console.log('specialeffect.seconds : ' + specialeffect.seconds)

    foreground.pb.seconds = specialeffect.seconds;

    levelView.playStealthSoundEffect();

    // reset the progressbar value
    foreground.pb.reset();
    // start the simple timer
    specialEffectTimerRunning  = true;
}

//
// zero gravity
//
function applyZeroGravity(specialeffect){
    // set the timer to false
    specialEffectTimerRunning  = false;

    saita.linearVelocity = Qt.point(saita.linearVelocity.x,0);

    foreground.pb.seconds = 2.5
    gravity = 0;

    // reset the progressbar value
    foreground.pb.reset();
    // start the simple timer
    specialEffectTimerRunning  = true;
}

//
// applies all the functionality of the bullet effect
//
function applyBulletEffect(specialeffect){
    // set the timer to false
    specialEffectTimerRunning  = false;

//    saita.applyLinearImpulse(Qt.point(500,0),Qt.point(saita.x + saita.width/2,saita.y+saita.height/2))

    saita.proportion = specialeffect.speedIncreaseProportion
    saita.state = 'bullet'
    saitaSpeed = saita.linearVelocity.x*specialeffect.speedIncreaseProportion*specialeffect.speedIncreaseProportion

    levelView.playBulletSoundEffect();

    console.log('specialeffect.seconds : ' + specialeffect.seconds)

    foreground.obstacles.slowDownTimer()

    foreground.pb.seconds = specialeffect.seconds;

    // reset the progressbar value
    foreground.pb.reset();
    // start the simple timer
    specialEffectTimerRunning  = true;
}

//
// applies all the functionality of the night effect
//
function applyNightEffect(specialeffect){
    // set the timer to false
    specialEffectTimerRunning  = false;

    levelView.playNightSoundEffect();

    foreground.pb.seconds = specialeffect.seconds;

    // reset the progressbar value
    foreground.pb.reset();
    // start the simple timer
    specialEffectTimerRunning  = true;

    activateNightElement();
}

//
// self explanatory
//
function activateNightElement(){
    nightImage.opacity = 1;
}

//
// self explanatory
//
function inActivateNightElement(){
    nightImage.opacity = 0;
}

//
// self explanatory
//
function inActivateVisibleObstacles(){
    foreground.inActivateVisibleObstacles();
}

//
// self explanatory
//
function activateVisibleObstacles(){
    foreground.activateVisibleObstacles();
}

//
// apply the special effect depending on the type of the specialeffecttype value
// the specialeffecttype value is set on the hideExtrasItem function
//
function applySpecialEffect(specialeffect){
    var play = true;

    if(specialeffecttype == EXTRAS_TYPE_STEALTH)
        applyStealthEffect(specialeffect);
    else if(specialeffecttype == EXTRAS_TYPE_BULLET)
        applyBulletEffect(specialeffect);
    else if(specialeffecttype == EXTRAS_TYPE_NIGHT)
        applyNightEffect(specialeffect);
    else if(specialeffecttype == EXTRAS_TYPE_ZEROGRAVITY)
        applyZeroGravity(specialeffect);
    else if(specialeffecttype == EXTRAS_TYPE_SCISSOR){
        applyScissorEffect(specialeffect);
        play = false;
    }
    else if(specialeffecttype == EXTRAS_TYPE_SLOWDOWN)
        applySlowDownEffect(specialeffect);
    else if(specialeffecttype == EXTRAS_TYPE_STEALTHALT)
        applyAltStealthEffect(specialeffect);
    else if(specialeffecttype == EXTRAS_TYPE_SRINK)
        applySrinkEffect(specialeffect);

    if(play)
        // start the sound effect
        levelView.playApplySpecialEffectSoundEffect();
}

//
// stop the special effect depending on the specialeffecttype value
// the specialeffecttype value is set on the hideExtrasItem function
//
function stopSpecialEffect(){
    foreground.pb.stop();
    levelView.stopApplySpecialEffectSoundEffect();

    if(specialeffecttype == EXTRAS_TYPE_STEALTH){
        saita.state = 'running'
        activateVisibleObstacles();
        gravity = -4;
    }else if(specialeffecttype == EXTRAS_TYPE_BULLET){
        saita.state = 'running'
//        setSaitaSpeed(saitaSpeed);
        setSaitaSpeed(initialSaitaSpeed);
        saitaSpeed = saita.linearVelocity.x;

        console.log('stoping bullet special effect ..')

    }else if(specialeffecttype == EXTRAS_TYPE_NIGHT){
        inActivateNightElement();
    }else if(specialeffecttype == EXTRAS_TYPE_ZEROGRAVITY){
        gravity = -4;
    }else if(specialeffecttype == EXTRAS_TYPE_SLOWDOWN){
        saita.state = 'running'
//        setSaitaSpeed(saitaSpeed);
        setSaitaSpeed(initialSaitaSpeed);
        saitaSpeed = saita.linearVelocity.x;

        console.log('stoping slow down special effect ..')
    } else if(specialeffecttype == EXTRAS_TYPE_STEALTHALT){
        saita.state = 'running'
        activateSaitasArrayElements();
        gravity = -4;
    }else if(specialeffecttype == EXTRAS_TYPE_SRINK){
        saita.state = 'running'
        saita.resetSrink()
        if(foreground.pb.mPBRunning)
            force = 4.5*force;

        console.log('force : ' + force);
    }

    specialEffectTimerRunning = false
}

//
// Delete and reset scene parameters.
//
function reset(){

    // reset saita values
    saita.rotation = 0;
    saita.linearVelocity.x = 0;
    saita.linearVelocity.y = 0;
    saita.x = foreground.hand.width-55
    saita.y = classroom.height / 2 - saita.height
    saita.z = 200;
    saita.state = 'onHand'
    saita.active = false;
}

//
// self explanatory
//
function restartGame(){
    // firstly reset game parameters
    reset()
}

//
// Hides and removes the extras item from the extrasArray given an index no equals to idxNo
//
function hideExtrasItem(idxNo){
    for (var i = 0; i < extrasArray.length; i++) {
        var obj = extrasArray[i];

        if(obj != null && obj.indexNo == idxNo){
            // get the extras type
            var extrasType = obj.extrasType;

            if(extrasType == EXTRAS_TYPE_BONUS) // bonus type extras
            {
                appendBonus(obj);
            }
            else // special effect type extras
            {
                stopSpecialEffect();

                specialeffecttype = extrasType;

                applySpecialEffect(obj);
                // reset specialEffect properties and destroy object
                obj.visible           = false;
                obj.source            = ""
                obj.destroy();
            }

            return;
        }
    }
}

//
function createEnemySaita(){
    var component = Qt.createComponent(Qt.resolvedUrl('obstacles/EnemySaita.qml'));

    if(component.status == Component.Ready){
        var object = component.createObject(foreground.worldClassroom,
                                            {
                                                "parent": foreground.worldClassroom,
                                                "x": foreground.worldClassroom.width-foreground.obstacles.spacing,
                                                "y": foreground.worldClassroom.height*((4-helperCounter)/5),
                                                "force": -90
                                            } );
        object.z = 200
        object.linearVelocity = Qt.point(-110,0)
        object.bottomBorder = foreground.worldClassroom.height* ((4-helperCounter)/5)

        saitasArray.push(object);
    }else
        console.log(component.errorString())

    if(++helperCounter == 4){
        helperCounter = 1;
    }
}
