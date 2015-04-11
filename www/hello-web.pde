//GLOBAL FLAGS
var turnF = 9999;
var actionF = 0;

var selectedUnit = 0;

var setCounter = 0;

//UNIT ATTRIBUTES

unitSize = 25;

var unit1x = 9999;
var unit1y = 9999;
var unitlock1 = 0;

var unit2x = 9999;
var unit2y = 9999;
var unitlock2 = 0;

var unit3x = 9999;
var unit3y = 9999;
var unitlock3 = 0;

var unit4x = 9999;
var unit4y = 9999;
var unitlock4 = 0;

var unit5x = 9999;
var unit5y = 9999;
var unitlock5 = 0;

var unit6x = 9999;
var unit6y = 9999;
var unitlock6 = 0;

//RADAR INDICATOR
var curRadarCenterx = 0;
var curRadarCentery = 0;

var curRadarValx = 0;
var curRadarValy = 0;

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
fireF=0;

bulletposx = 0;
bulletposy = 0;
startingPointx = 0;
startingPointy = 0;

//MOUSE STATE

var curmouseClickx = 0;
var curmouseClicky = 0;

// Setup the Processing Canvas
void setup(){
  size(500, 850);
  strokeWeight(2);
  background(255,255,255);
  frameRate( 15 );

  if(turnF==9999){
    toggleTurn();

    tint(255, 127);
    stroke(1);

    fill(255, 50, 50);
    rect(0, 425, 500, 425);

    textSize(20);
    textAlign(CENTER);

    fill(0, 0, 0);
    String s = "PLACE UNITS";
    text(s, 50, 610, 400, 400);
  }

  //base 1
  fill(255, 50, 50);
  rect(100, 830, 300, 25); 

  //base 2
  fill(50, 50, 255);
  rect(100, 0, 300, 25); 
}

void draw(){
     if(radarF1==1){
      radar(unit1x,unit1y,0);
     }
     if(radarF2==1){
      radar(unit2x,unit2y,0);
     }
     if(radarF3==1){
      radar(unit3x,unit3y,0);
     }
     if(radarF4==1){
      radar(unit4x,unit4y,1);
     }
     if(radarF5==1){
      radar(unit5x,unit5y,1);
     }
     if(radarF6==1){
      radar(unit6x,unit6y,1);
     }

     if(strengthF==1){
      strength();
     }

     if(fireF==1){
      fire();
     }
      
}

void resetBack(){
  //base 1
  fill(255, 50, 50);
  rect(100, 830, 300, 25); 

  //base 2
  fill(50, 50, 255);
  rect(100, 0, 300, 25); 

  fill(224, 90, 90);
  ellipse(unit1x, unit1y, unitSize, unitSize);
  ellipse(unit2x, unit2y, unitSize, unitSize);
  ellipse(unit3x, unit3y, unitSize, unitSize);
  fill(90, 90, 224);
  ellipse(unit4x, unit4y, unitSize, unitSize);
  ellipse(unit5x, unit5y, unitSize, unitSize);
  ellipse(unit6x, unit6y, unitSize, unitSize);
}

//TURN FUNCTIONS
void toggleTurn(){
  if(turnF==9999){
    //alert("Red's Turn");
    turnF=0;
    lockBlue();
  }
  else if(turnF==0){
    //alert("Blue's Turn");
    turnF=1;
    lockRed();
  }
  else if(turnF==1){
    //alert("Red's Turn");
    turnF=0;
    lockBlue();
  }
}

void lockRed(){
  unitlock1 = 1;
  unitlock2 = 1;
  unitlock3 = 1;

  unitlock4 = 0;
  unitlock5 = 0;
  unitlock6 = 0;
}

void lockBlue(){
  unitlock1 = 0;
  unitlock2 = 0;
  unitlock3 = 0;

  unitlock4 = 1;
  unitlock5 = 1;
  unitlock6 = 1;
}

//SETTING UNITS FUNCTIONS

void setUnits(){
  if(setCounter<6){

    if(turnF==0){
      if(curmouseClickx<500&&curmouseClicky<425){
        alert("Restricted Area!");
      }
      else{
        setUnit(curmouseClickx,curmouseClicky,0,setCounter);
        
        toggleTurn();

        setCounter++;
      }
    }
    else if(turnF==1){
      if(curmouseClickx<500&&curmouseClicky>425){
        alert("Restricted Area!");
      }
      else{
        setUnit(curmouseClickx,curmouseClicky,1,setCounter);
      
        toggleTurn();

        setCounter++;
      }
    }
  }

}

void setUnit(x,y,faction,turn){
  if(faction==0){
    fill(224, 90, 90);
    if(turn==0){
      ellipse(x, y, unitSize, unitSize);
      unit1x = x;
      unit1y = y;
    }
    else if(turn==2){
      ellipse(x, y, unitSize, unitSize);
      unit2x = x;
      unit2y = y;
    }
    else if(turn==4){
      ellipse(x, y, unitSize, unitSize);
      unit3x = x;
      unit3y = y;
    }
  }
  else if(faction==1){
    fill(90, 90, 224);
    if(turn==1){
      ellipse(x, y, unitSize, unitSize);
      unit4x = x;
      unit4y = y;
    }
    else if(turn==3){
      ellipse(x, y, unitSize, unitSize);
      unit5x = x;
      unit5y = y;
    }
    else if(turn==5){
      ellipse(x, y, unitSize, unitSize);
      unit6x = x;
      unit6y = y;
    }
  }
}

void showRestrictedArea(turn){
  setup();

  //showing restrictedArea
  tint(255, 127);
  stroke(1);

  textSize(20);
  textAlign(CENTER);
  

  if(turn==0){
    fill(255, 50, 50);
    rect(0, 425, 500, 425);

    fill(0, 0, 0);
    String s = "PLACE UNITS";
    text(s, 50, 610, 400, 400);
  }
  else if(turn==1){
    fill(50, 190, 255);
    rect(0, 0, 500, 425); 

    fill(0, 0, 0);
    String s = "PLACE UNITS";
    text(s, 50, 210, 400, 400);
  }
    
  resetBack();
}

//RADAR FUNCTIONS

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

   setup();
   resetBack();
}

void radar(unitcenterx, unitcentery, faction){
    curRadarCenterx = unitcenterx;
    curRadarCentery = unitcentery;

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

//STRENGTH FUNCTION
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
    setup();
    //SHOOTING ALGORITHM
     fill(255, 255, 255);
     ellipse(bulletposx, bulletposy, 5, 5);
     fill(0, 0, 0);

     if(bulletposy>=startingPointy-50){
        bulletposy -= 4;
     }
     bulletposx -= 0;
     
     ellipse(bulletposx, bulletposy, 5, 5);

     resetBack();
}

//CHECKING ACTIONS
boolean checkUnitHit(currentx,currenty){
    if(checkHit(currentx,currenty,unit1x,unit1y,unitlock1)){
        //RADAR ACTIVATION
        radarOff();
        radarF1=1;

        selectedUnit = 1;

        toggleTurn();
    }
    else if(checkHit(currentx,currenty,unit2x,unit2y,unitlock2)){
        radarOff();
        radarF2=1;

        selectedUnit = 2;

        toggleTurn();
    }
    else if(checkHit(currentx,currenty,unit3x,unit3y,unitlock3)){
        radarOff();
        radarF3=1;

        selectedUnit = 3;

        toggleTurn();
    }
    else if(checkHit(currentx,currenty,unit4x,unit4y,unitlock4)){
        radarOff();
        radarF4=1;

        selectedUnit = 4;

        toggleTurn();
    }
    else if(checkHit(currentx,currenty,unit5x,unit5y,unitlock5)){
        radarOff();
        radarF5=1;

        selectedUnit = 5;

        toggleTurn();
    }
    else if(checkHit(currentx,currenty,unit6x,unit6y,unitlock6)){
        radarOff();
        radarF6=1;

        selectedUnit = 6;

        toggleTurn();
    }
    else{
      if(selectedUnit==0){

      }
      else{
        //initialize strength

        if(selectedUnit==0){

        }
        else{
          curRadarValuex = sin(s) * 30 + curRadarCenterx;
          curRadarValuey = sin(s) * 30 + curRadarCentery;

          //alert("STRENGHT! Returned Radar values- x:" + curRadarValuex + " y:" + curRadarValuey);

          radarOff();
          setup();
          resetBack();

          strengthF = 1;

          actionF = 3;
        }
      }
    }
}

boolean checkHit(mousex,mousey,unitx,unity,unitlock){
  if((mousex>unitx-unitSize/2&&mousex<unitx+unitSize/2)&&(mousey>unity-unitSize/2&&mousey<unity+unitSize/2)&&unitlock==0){
    return true;
  }
  else{
    return false;
  }
}

void main(){
  actionF = 1;
}

main();

mouseClicked = function() {
  curmouseClickx = mouseX;
  curmouseClicky = mouseY;

  if(actionF == 1){
    setUnits();
    if(setCounter<6){
      showRestrictedArea(turnF);
    }
    else if(setCounter>=6){
      setup();
      resetBack();
      actionF=2;
    }
  }
  else if(actionF == 2){
    fireF = 0;

    //alert("Selection Phase");
    checkUnitHit(curmouseClickx,curmouseClicky);   
  }
  else if(actionF == 3){
    //alert("return Strength! Prepare to move!x:" + sin(s) * 30 + curRadarValuex + " y:" +sin(s) * 30 + curRadarValuey);

    curRadarValuex = 0;
    curRadarValuey = 0;

    strengthF = 0;
  
    setup();
    resetBack();

    actionF = 4;
  }
  else if(actionF == 4){
    alert("Fire Bullet!");

    if(selectedUnit==1){
      alert("Unit 1 firing!");
      setfirePoint(unitred1x,unitred1y);
      fireF = 1;
    }
    else if(selectedUnit==2){
      alert("Unit 2 firing!");
    }
    else if(selectedUnit==3){
      alert("Unit 3 firing!");
    }
    else if(selectedUnit==4){
      alert("Unit 4 firing!");
    }
    else if(selectedUnit==5){
      alert("Unit 5 firing!");
    }
    else if(selectedUnit==6){
      alert("Unit 6 firing!");
    }

    actionF = 2;
    selectedUnit = 0;
  }
  else if(actionF == 5){

  }
  else if(actionF == 6){

  }
}