// Global variables
float radius = 50.0;
int X, Y;
int nX, nY;
int delay = 16;

var bite = 40;

// Setup the Processing Canvas
void setup(){
  size( 500, 900 );
  strokeWeight( 10 );
  background(255,255,255);
  frameRate( 15 );
  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;  

  // tomato
  noStroke();
  fill(224, 90, 90);
  ellipse(150+80, 200, 150, 150);
  ellipse(212+80, 200, 150, 150);
    
  // stem
  fill(48+80, 130, 31);
  rect(176+80, 103, 12, 32);   
}

// Main draw loop
void draw(){
     // take a bite out of the tomato!
    fill(255, 255, 255);
    ellipse(mouseX, mouseY, bite, bite);

    textSize(32);
    textAlign(CENTER);
    fill(0, 0, 0);
    String s = "Potatocodes Eating the Tomato!";
    text(s, 50, 400, 400, 200);
}


// Set circle's next destination
void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}