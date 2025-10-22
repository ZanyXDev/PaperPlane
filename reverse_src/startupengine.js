var startupSaitaArray = new Array();

function clearObjects(){
    var obj = 0;

    // delete and destroy bonuns elements
    for(var i = 0; i < startupSaitaArray.length; i++){
        obj = startupSaitaArray[i];
        // remove the element from the extras array
        // splice the array.
        startupSaitaArray.splice(i,1);
        i--;

        // destroy the extras object from raceCanvas
        obj.visible = false;
        obj.destroy();
    }
}

function generateSaita(){
    var object = saitaComponent.createObject(startupWorld);

    if(object != null){
        var randomY = Math.floor(Math.random() * startupAnimationScreen.height/2.5) + 80;

        object.y = randomY;
        object.x = -object.width;
        object.linearVelocity =  Qt.point(280,0);

        startupSaitaArray.push(object);
    }
}

function checkSpeedLost(){
    var object = 0;

    for(var i = 0; i < startupSaitaArray.length; i++){
        object = startupSaitaArray[i];

        if(object != null && object.linearVelocity.x < 280){
            startupSaitaArray.splice(i,1);
            i--;

            // destroy the extras object from raceCanvas
            object.visible = false;
            object.destroy();
        }
    }
}
