// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

redunit1x = 100;
redunit1y = 700;

bulletposx = 380;
bulletposy = 700;

var bite = 40;

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

  strokeWeight( 5 );

  //base 1
  fill(0, 0, 0);
  rect(100, 830, 300, 25); 

  //base 2
  fill(0, 0, 0);
  rect(100, 0, 300, 25); 

  //units 1
  fill(224, 90, 90);
  ellipse(redunit1x, redunit1y, 25, 25);

  fill(224, 90, 90);
  ellipse(150+80, 650, 25, 25);

  fill(224, 90, 90);
  ellipse(300+80, 700, 25, 25);

  //BULLET
  fill(0, 0, 0);
  ellipse(bulletposx, bulletposy, 5, 5);

  //units 2
  fill(90, 90, 224);
  ellipse(100, 70, 25, 25);

  ellipse(150+80, 80, 25, 25);

  ellipse(300+80, 70, 25, 25);
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

     //SHOOTING ALGORITHM
     //noStroke();
     //fill(255, 255, 255);
     //ellipse(bulletposx, bulletposy, 5, 5);
     //fill(0, 0, 0);
     //bulletposx -= 0;
     //bulletposy -= 4;
     //ellipse(bulletposx, bulletposy, 5, 5);
     
     //textSize(32);
     //textAlign(CENTER);
     //fill(0, 0, 0);
     //String s = "SAPUL!";
     //text(s, 50, 400, 400, 200);
}

void move(){
    
}

// Set circle's next destination
void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}