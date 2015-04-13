//GLOBAL FLAGS
var turnF = 9999;
var actionF = 0;

blueScore = 0;
redScore = 0;

var selectedUnit = 0;
var currentUnitx = 0;
var currentUnity = 0;

var setCounter = 0;

//MENU ITEMS
var boxSizex = 0;
var boxSizey = 0;

var bx = 0;
var by = 0;

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
var markx = 0;
var marky = 0;

var curRadarCenterx = 0;
var curRadarCentery = 0;

var curRadarValuex = 0;
var curRadarValuey = 0;

var curDirectionx = 0;
var curDirectiony = 0;

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
var strengthF = 0;

var curStrength = 0;

var strengthBar = 400;
var directionFlag = 1;

//FIRING MECHANISM
var fireF=0;

var targetMarkx = 0;
var targetMarky = 0;

var bulletposx = 0;
var bulletposy = 0;
var startingPointx = 0;
var startingPointy = 0;

//MOVEMENT
moveF = 0;

movex = 0;
movey = 0;

//MOUSE STATE

var curmouseClickx = 0;
var curmouseClicky = 0;

// Setup the Processing Canvas
void setup(){
  size(screen.width, screen.height);
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

     if(moveF==1){
      move();
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
    setup();

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

    resetBack();
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

    if(turnF==0){
      curStrength = 400 - strengthBar;
    }
    else{
      curStrength = strengthBar;
    }

    fill(90, 90, 224);
    rect(200, 200, 50, strengthBar);
}

//SET FIRING POINTS COORDINATE
void setfirePoint(unitpointx,unitpointy){
    rangeCounter = 0;

    bulletposx = unitpointx;
    bulletposy = unitpointy;

    startingPointx = unitpointx;
    startingPointy = unitpointy;
}

//FIRING ALGORITHM
void fire(){
    setup();
    //SHOOTING ALGORITHM

    var rangeFinder = 0;

    rangeFinder = getRange(curStrength);

    rangeCounter++;
    
    bulletposx -= targetMarkx;
    bulletposy -= targetMarky; 
    
    if(rangeCounter<=rangeFinder){
      ellipse(bulletposx, bulletposy, 5, 5);
    }
    else{
      fireF = 0;
    }
    hitCheck();
    resetBack();
}

void hitCheck(){
  if(collisionCheck(unit1x,unit1y,bulletposx,bulletposy)){
    unit1x = 9999;
    unit1y = 9999;

    blueScore++;
    checkWin();

    fireF = 0;

    setup();
    resetBack();
  }
  else if(collisionCheck(unit2x,unit2y,bulletposx,bulletposy)){
    unit2x = 9999;
    unit2y = 9999;

    blueScore++;
    checkWin();

    fireF = 0;

    setup();
    resetBack();
  }
  else if(collisionCheck(unit3x,unit3y,bulletposx,bulletposy)){
    unit3x = 9999;
    unit3y = 9999;

    blueScore++;
    checkWin();

    fireF = 0;

    setup();
    resetBack();
  }
  else if(collisionCheck(unit4x,unit4y,bulletposx,bulletposy)){
    unit4x = 9999;
    unit4y = 9999;

    redScore++;
    checkWin();

    fireF = 0;

    setup();
    resetBack();
  }
  else if(collisionCheck(unit5x,unit5y,bulletposx,bulletposy)){
    unit5x = 9999;
    unit5y = 9999;

    redScore++;
    checkWin();

    fireF = 0;

    setup();
    resetBack();
  }
  else if(collisionCheck(unit6x,unit6y,bulletposx,bulletposy)){
    unit6x = 9999;
    unit6y = 9999;
    
    redScore++;
    checkWin();

    fireF = 0;

    setup();
    resetBack();
  }
}

boolean collisionCheck(unitx,unity,bulletx,bullety){
  if((bulletx>unitx-unitSize/2&&bulletx<unitx+unitSize/2)&&(bullety>unity-unitSize/2&&bullety<unity+unitSize/2)){
    return true;
  }
  else{
    return false;
  }
}

int getRange(strength){
    if(curStrength<40){
       return 1;
    }
    else{
      return curStrength/40;
    }
}

//CHECK WIN
void checkWin(){
  //alert("RedScore:"+redScore+"BlueScore:"+blueScore);
  if(redScore>=3){
    //fill(0, 0, 0);
    //string gosr = "GAME OVER! RED WINS!";
    //text(gosr, 50, 550, 400, 400);

    alert("Red Wins");

    moveF = 0;
    actionF = 0;
    
    fill(50,255,255);
    bx = 100;
    by = 200;
    boxSizex = 300;
    boxSizey = 120;
    rect(bx, by, boxSizex, boxSizey);
    textSize(32);
    textAlign(CENTER);
    fill(0, 0, 0);
    String s = "RESTART GAME";
    text(s, 50, 250, 400, 400);
  }
  else if(blueScore>=3){
    //fill(0, 0, 0);
    //string gosb = "GAME OVER! BLUE WINS!";
    //text(gosb, 50, 550, 400, 400);

    alert("Blue Wins!");

    moveF = 0;
    actionF = 0;

    fill(50,255,255);
    bx = 100;
    by = 200;
    boxSizex = 300;
    boxSizey = 120;
    rect(bx, by, boxSizex, boxSizey);
    textSize(32);
    textAlign(CENTER);
    fill(0, 0, 0);
    String s = "RESTART GAME";
    text(s, 50, 250, 400, 400);
  }
}

//MOVEMENT
void initMove(startpointx,startpointy){
    movex=startpointx;
    movey=startpointy;
}

void move(){
    setup();
    
    movex -= markx;
    movey -= marky;

    if(turnF==0){
        fill(224, 90, 90);
    }
    else if(turnF==1){
        fill(90, 90, 224);
    }
    if(selectedUnit==1){
      unit1x = movex;
      unit1y = movey;
      ellipse(unit1x, unit1y, 30, 30);
    }
    else if(selectedUnit==2){
      unit2x = movex;
      unit2y = movey;
      ellipse(unit2x, unit2y, 30, 30);
    }
    else if(selectedUnit==3){
      unit3x = movex;
      unit3y = movey;
      ellipse(unit3x, unit3y, 30, 30);
    }
    else if(selectedUnit==4){
      unit4x = movex;
      unit4y = movey;
      ellipse(unit4x, unit4y, 30, 30);
    }
    else if(selectedUnit==5){
      unit5x = movex;
      unit5y = movey;
      ellipse(unit5x, unit5y, 30, 30);
    }
    else if(selectedUnit==6){
      unit6x = movex;
      unit6y = movey;
      ellipse(unit6x, unit6y, 30, 30);
    }

    if(movex==bulletposx&&movey==bulletposy){
        moveF = 0;
    }

    resetBack();
}

//CHECKING ACTIONS
boolean checkUnitHit(currentx,currenty){
    if(checkHit(currentx,currenty,unit1x,unit1y,unitlock1)){
        //RADAR ACTIVATION
        radarOff();
        radarF1=1;

        selectedUnit = 1;

        currentUnitx = unit1x;
        currentUnity = unit1y;
    }
    else if(checkHit(currentx,currenty,unit2x,unit2y,unitlock2)){
        radarOff();
        radarF2=1;

        selectedUnit = 2;

        currentUnitx = unit2x;
        currentUnity = unit2y;
    }
    else if(checkHit(currentx,currenty,unit3x,unit3y,unitlock3)){
        radarOff();
        radarF3=1;

        selectedUnit = 3;

        currentUnitx = unit3x;
        currentUnity = unit3y;
    }
    else if(checkHit(currentx,currenty,unit4x,unit4y,unitlock4)){
        radarOff();
        radarF4=1;

        selectedUnit = 4;

        currentUnitx = unit4x;
        currentUnity = unit4y;
    }
    else if(checkHit(currentx,currenty,unit5x,unit5y,unitlock5)){
        radarOff();
        radarF5=1;

        selectedUnit = 5;

        currentUnitx = unit5x;
        currentUnity = unit5y;
    }
    else if(checkHit(currentx,currenty,unit6x,unit6y,unitlock6)){
        radarOff();
        radarF6=1;

        selectedUnit = 6;

        currentUnitx = unit6x;
        currentUnity = unit6y;
    }
    else{
      if(selectedUnit==0){

      }
      else{
        //initialize strength

        if(selectedUnit==0){

        }
        else{
          curRadarValuex = cos(s) * 30 + curRadarCenterx;
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
    //CORRECT RADAR DIRECTION! AT LAST

    markx = 0;
    marky = 0;

    //alert("return Strength! Current"+unit1x+","+unit1y+"Prepare to move!x:" + curRadarValuex + " y:" + curRadarValuey);

    markx = currentUnitx - curRadarValuex;
    marky = currentUnity - curRadarValuey;

    strengthF = 0;
  
    setup();
    resetBack();

    //fill(255,90,50);
    //ellipse(curRadarValuex,curRadarValuey,5, 5);
    //ellipse(curRadarValuex-markx,curRadarValuey-marky, 5, 5);
    //ellipse(curRadarValuex-markx-markx,curRadarValuey-marky-marky, 5, 5);

    targetMarkx = markx;
    targetMarky = marky;

    //alert("Strength:"+curStrength+"Turn:"+turnF);
    //alert("Fire Bullet! : "+targetMarkx+":"+targetMarky);

    if(selectedUnit==1){
      //alert("Unit 1 firing!");
      setfirePoint(unit1x,unit1y);
      fireF = 1;
      fire();
    }
    else if(selectedUnit==2){
      //alert("Unit 2 firing!");
      setfirePoint(unit2x,unit2y);
      fireF = 1;
      fire();
    }
    else if(selectedUnit==3){
      //alert("Unit 3 firing!");
      setfirePoint(unit3x,unit3y);
      fireF = 1;
      fire();
    }
    else if(selectedUnit==4){
      //alert("Unit 4 firing!");
      setfirePoint(unit4x,unit4y);
      fireF = 1;
      fire();
    }
    else if(selectedUnit==5){
      setfirePoint(unit5x,unit5y);
      fireF = 1;
      fire();
    }
    else if(selectedUnit==6){
      setfirePoint(unit6x,unit6y);
      fireF = 1;
      fire();
    }

    initMove(currentUnitx,currentUnity);

    actionF = 4;
  }
  else if(actionF == 4){
    //alert("Unit1: "+unit1x+","+unit1y);

    moveF = 1;
    move();

    //alert("Unit1: "+unit1x+","+unit1y);

    actionF = 5;
  }
  else if(actionF == 5){
    moveF = 0;
    toggleTurn();

    actionF = 2;
    selectedUnit = 0;
  }
  else if(actionF == 6){

  }
}

boolean clickButton(){
  if((mouseX > bx-boxSizex && mouseX < bx+boxSizex) && 
  (mouseY > by-boxSizey && mouseY < by+boxSizey)){
    return true;
  }
  else{
    return false;
  }
}

void resetGame(){
  turnF = 9999;
  actionF = 0;

  blueScore = 0;
  redScore = 0;

  selectedUnit = 0;
  currentUnitx = 0;
  currentUnity = 0;

  setCounter = 0;

  //UNIT ATTRIBUTES

  unitSize = 25;

  unit1x = 9999;
  unit1y = 9999;
  unitlock1 = 0;

  unit2x = 9999;
  unit2y = 9999;
  unitlock2 = 0;

  unit3x = 9999;
  unit3y = 9999;
  unitlock3 = 0;

  unit4x = 9999;
  unit4y = 9999;
  unitlock4 = 0;

  unit5x = 9999;
  unit5y = 9999;
  unitlock5 = 0;

  unit6x = 9999;
  unit6y = 9999;
  unitlock6 = 0;

  //RADAR INDICATOR
  markx = 0;
  marky = 0;

  curRadarCenterx = 0;
  curRadarCentery = 0;

  curRadarValuex = 0;
  curRadarValuey = 0;

  curDirectionx = 0;
  curDirectiony = 0;

  counter1 = 1;
  counter2 = 2;

  float s = 1;

  second = 1;
  second1 = 1;
  second2 = 1;
  second3 = 1;

  radarF1 = 0;
  radarF2 = 0;
  radarF3 = 0;
  radarF4 = 0;
  radarF5 = 0;
  radarF6 = 0;

  //BAR INDICATOR
  strengthF = 0;

  curStrength = 0;

  strengthBar = 400;
  directionFlag = 1;

  //FIRING MECHANISM
  fireF=0;

  targetMarkx = 0;
  targetMarky = 0;

  bulletposx = 0;
  bulletposy = 0;
  startingPointx = 0;
  startingPointy = 0;

  //MOVEMENT
  moveF = 0;

  movex = 0;
  movey = 0;

  //MOUSE STATE

  curmouseClickx = 0;
  curmouseClicky = 0;
}