//GLOBAL FLAGS
turnF = 0;

//UNIT STATES

    //red units
    unit1F=0;
    redunit1x = 100;
    redunit1y = 700;

    unit2F=0;
    redunit2x = 230;
    redunit2y = 650;

    unit3F=0;
    redunit3x = 380;
    redunit3y = 700;

    unit4F=0;
    //blue units
    blueunit1x = 100;
    blueunit1y = 70;

    unit5F=0;
    blueunit2x = 230;
    blueunit2y = 80;

    unit6F=0;
    blueunit3x = 380;
    blueunit3y = 70;

unitSize=25;

//RADAR INDICATOR
var counter1 = 1;
var counter2 = 2;

float s = 1;

var second = 1;
var second1 = 1;
var second2 = 1;
var second3 = 1;

var radarF1 = 0;
var radarF2 = 0;
var radarF3 = 0;
var radarF4 = 0;
var radarF5 = 0;
var radarF6 = 0;

//BAR INDICATOR
strengthF = 0;

strengthBar = 400;
directionFlag = 1;

//FIRING MECHANISM
bulletposx = 0;
bulletposy = 0;
startingPointx = 0;
startingPointy = 0;

//MOVEMENT
movex = 0;
movey = 0;

// Setup the Processing Canvas
void setup(){
  size( 500, 850 );
  strokeWeight( 10 );
  background(255,255,255);
  frameRate( 15 );
  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;  

  strengthF = 0;

  int radius = min(width, height) / 2;
  var secondsRadius;

  cursorPointer = redunit1y-20;

  strokeWeight( 5 );

  //base 1
  fill(0, 0, 0);
  rect(100, 830, 300, 25); 

  //base 2
  fill(0, 0, 0);
  rect(100, 0, 300, 25); 

  //RED UNITS
  fill(224, 90, 90);
  ellipse(redunit1x, redunit1y, unitSize, unitSize);
  ellipse(redunit2x, redunit2y, unitSize, unitSize);
  ellipse(redunit3x, redunit3y, unitSize, unitSize);

  //BULLET
  //fill(0, 0, 0);
  //ellipse(bulletposx, bulletposy, 5, 5);

  //BLUE UNITS
  fill(90, 90, 224);
  ellipse(blueunit1x, blueunit1y, unitSize, unitSize); //unit1
  ellipse(blueunit2x, blueunit2y, unitSize, unitSize); //unit2
  ellipse(blueunit3x, blueunit3y, unitSize, unitSize); //unit3

  //radar
  //fill(90, 90, 224);
  //line(redunit1x, redunit1y, redunit1x, cursorPointer);

  secondsRadius = radius * 0.72;
}

void clearUnitFlags(){
  unit1F = 0;
  unit2F = 0;
  unit3F = 0;
  unit4F = 0;
  unit5F = 0;
  unit6F = 0;
}

// Main draw loop
void draw(){
     // take a bite out of the tomato!
     // fill(255, 255, 255);
     // ellipse(mouseX, mouseY, bite, bite);

     //MOVING ALGORITHM
     //noStroke();
     //fill(255, 255, 255);
     //ellipse(redunit1x, redunit1y, 30, 30);
     //redunit1x += 5;
     //redunit1y -= 5;
     //fill(224, 90, 90);
     //strokeWeight( 5 );
     //ellipse(redunit1x, redunit1y, 25, 25);
     
     //textSize(32);
     //textAlign(CENTER);
     //fill(0, 0, 0);
     //String s = "SAPUL!";
     //text(s, 50, 400, 400, 200);
    
    if(strengthF==1){
      strength();
    }
     
     fire();
     move();

     if(radarF1==1){
      radar(redunit1x,redunit1y,0);
     }
     else if(radarF2==1){
      radar(redunit2x,redunit2y,0);
     }
     else if(radarF3==1){
      radar(redunit3x,redunit3y,0);
     }
     else if(radarF4==1){
      radar(blueunit1x,blueunit1y,1);
     }
     else if(radarF5==1){
      radar(blueunit2x,blueunit2y,1);
     }
     else if(radarF6==1){
      radar(blueunit3x,blueunit3y,1);
     }
}

//INITIATING RADAR

boolean isradarActivated(){
  if(radarF1==1||radarF2==1||radarF3==1||radarF4==1||radarF5==1||radarF6==1){
    return true;
  }
  else{
    return false;
  }
}

void radarOff(){
   radarF1=0;
   radarF2=0;
   radarF3=0;
   radarF4=0;
   radarF5=0;
   radarF6=0;

   s=0;

   second1=0;
   second2=0;
   second=0;
}

void radar(unitcenterx, unitcentery, faction){
    fill(80);

    noStroke();

    if(faction==0){
      second1 += 2;
      second = second1;
    }
    else if(faction==1){
      second2 +=2;
      second = second2;
    }

    s = map(second, 0, 120, 0, TWO_PI) - HALF_PI;

    if(second==120){
        second = 1;
    }

    if(faction==0){
        fill(224, 90, 90);
    }
    else{
        fill(90, 90, 224);
    }

    stroke(0,0,0);
    strokeWeight(5);
    ellipse(unitcenterx, unitcentery, 25, 25);

    stroke(255,255,255);
    strokeWeight(10);
    line(unitcenterx, unitcentery, cos(s) * 30 + unitcenterx, sin(s) * 30 + unitcentery);

    stroke(0,0,0);
    strokeWeight(2);
    line(unitcenterx, unitcentery, cos(s) * 30 + unitcenterx, sin(s) * 30 + unitcentery);
}

//STRENGTH ALGORITHM
boolean isStrengthActivated(){
  if(strengthF==0){
    return false;
  }
  else if(strengthF==1){
    return true;
  }
}

void strength(){
    stroke(0,0,0);
    strokeWeight(2);
    fill(224, 90, 90);
    rect(200,200,50,400);

    if(directionFlag==1&&strengthBar==10){
        directionFlag=0;
    }
    else if(directionFlag==0&&strengthBar==390){
        directionFlag=1;
    }

    if(directionFlag==1){
        strengthBar -= 10;
    }
    else if(directionFlag==0){
        strengthBar += 10;
    }

    fill(90, 90, 224);
    rect(200, 200, 50, strengthBar);
}

//SET FIRING POINTS COORDINATE
void setfirePoint(unitpointx,unitpointy){
    bulletposx = unitpointx;
    bulletposy = unitpointy;

    startingPointx = unitpointx;
    startingPointy = unitpointy;
}

//FIRING ALGORITHM
void fire(){
    //SHOOTING ALGORITHM
     noStroke();
     fill(255, 255, 255);
     ellipse(bulletposx, bulletposy, 5, 5);
     fill(0, 0, 0);

     if(bulletposy>=startingPointy-50){
        bulletposy -= 4;
     }
     bulletposx -= 0;
     
     ellipse(bulletposx, bulletposy, 5, 5);
}

void initMove(startpointx,startpointy){
    movex=startpointx;
    movey=startpointy;
}

void move(startpointx,startpointy,faction){
    noStroke();
    fill(255, 255, 255);
    ellipse(movex, movey, 32, 32);

    movex += 0;
    movey -= 5;

    if(faction==0){
        fill(224, 90, 90);
    }
    else if(faction==1){
        fill(90, 90, 224);
    }

    stroke(0,0,0);
    strokeWeight(5);
    ellipse(movex, movey, 25, 25);
}

//CHECKING ACTIONS
boolean checkUnitHit(currentx,currenty){
    if((currentx>redunit1x-unitSize/2&&currentx<redunit1x+unitSize/2)&&(currenty>redunit1y-unitSize/2&&currenty<redunit1y+unitSize/2)){
        alert("Hit Red unit 1");

        setup();
        clearUnitFlags();
        unit1F=1;
        
        //FIRING MECHANISM
        //setfirePoint(redunit1x,redunit1y);
        //fire();

        //MOVEMENT
        //initMove(redunit1x,redunit1y);
        //move(redunit1x,redunit1y,0);

        //RADAR ACTIVATION
        radarOff();
        radarF1=1;
    }
    else if((currentx>redunit2x-unitSize/2&&currentx<redunit2x+unitSize/2)&&(currenty>redunit2y-unitSize/2&&currenty<redunit2y+unitSize/2)){
        setup();
        clearUnitFlags();
        unit2F=1;

        alert("Hit Red unit 2");

        //FIRING MECHANISM
        //setfirePoint(redunit2x,redunit2y);
        //fire();

        //RADAR ACTIVATION
        radarOff();
        radarF2=1;
    }
    else if((currentx>redunit3x-unitSize/2&&currentx<redunit3x+unitSize/2)&&(currenty>redunit3y-unitSize/2&&currenty<redunit3y+unitSize/2)){
        setup();
        clearUnitFlags();
        unit3F=1;

        alert("Hit Red unit 3");

        //RADAR ACTIVATION
        radarOff();
        radarF3=1;
    }

    else if((currentx>blueunit1x-unitSize/2&&currentx<blueunit1x+unitSize/2)&&(currenty>blueunit1y-unitSize/2&&currenty<blueunit1y+unitSize/2)){
        setup();
        clearUnitFlags();
        unit4F=1;

        alert("Hit Blue unit 1");

        radarOff();
        radarF4=1;
    }
    else if((currentx>blueunit2x-unitSize/2&&currentx<blueunit2x+unitSize/2)&&(currenty>blueunit2y-unitSize/2&&currenty<blueunit2y+unitSize/2)){
        setup();
        clearUnitFlags();
        unit5F=1;

        alert("Hit Blue unit 2");
      
        radarOff();
        radarF5=1;
    }
    else if((currentx>blueunit3x-unitSize/2&&currentx<blueunit3x+unitSize/2)&&(currenty>blueunit3y-unitSize/2&&currenty<blueunit3y+unitSize/2)){
        setup();
        clearUnitFlags();
        unit6F=1;

        alert("Hit Blue unit 3");
    
        radarOff();
        radarF6=1;
    }
}

mouseClicked = function() { 
    currentmousePosx = mouseX;
    currentmousePosy = mouseY;

    if(isStrengthActivated()){
      strengthF=0;
      setup();
      if(unit1F==1){
        setfirePoint(redunit1x,redunit1y);
      }
      else if(unit2F==1){
        setfirePoint(redunit2x,redunit2y);
      }
      else if(unit3F==1){
        setfirePoint(redunit3x,redunit3y);
      }
      else if(unit4F==1){
        setfirePoint(blueunit1x,blueunit1y);
      }
      else if(unit5F==1){
        setfirePoint(blueunit2x,blueunit2y);
      }
      else if(unit6F==1){
        setfirePoint(blueunit3x,blueunit3y);
      }
      fire();
    }

    if(isradarActivated()){
      radarOff();
      setup();
      strengthF = 1;
    }

    checkUnitHit(currentmousePosx,currentmousePosy);

    alert("Your mouse position: " + currentmousePosx + "," + currentmousePosy);
};

// Set circle's next destination
void mouseMoved(){
  nX = mouseX;
  nY = mouseY;
}