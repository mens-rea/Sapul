// Because x is 50, only the rectangle draws
int x = 50;
if (x > 100) {              // If x is greater than 100,
  ellipse(50, 50, 36, 36);  // draw this ellipse
}
if (x < 100) {              // If x is less than 100,
  rect(33, 33, 34, 34);     // draw this rectangle
}
line(20, 20, 80, 80);       
