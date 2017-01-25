/* @author Tomas de camino Beck */
PFont font;
int slide =0;

void setup() {
  size(600, 600); 

  font = loadFont("MyUnderwood-48.vlw");
  textFont(font, 28);
}

void draw() {
  background(255);
  switch(slide){
    case 0:
      background(0);
      break;
    case 1:
      drawPyt(50+random(-1, 1), 100+random(-1, 1), mouseY, map(mouseX, 0, width, 0, 200));
    
  }
  
}

void drawPyt(float x, float y, float side, float a) {
  float b = side-a;
  noFill();
  stroke(#0518B4);
  rect(x, y, side, side);
  rect(x, y, side/20, side/20);
  pushMatrix();
  translate(x+a, y);
  fill(0);
  if (a>10) {
    text("b", -(a+20), b/2);
    text("a", -a/2, -10);
  }

  float ang = atan2(b, a);
  pushMatrix();
  rotate(HALF_PI-ang);
  float h =sqrt(sq(a)+sq(b));
  fill(255);
  stroke(#EDCF35);
  strokeWeight(2);
  rect(0, 0, h, h);
  fill(0);
  text("h", 5, side/2); 
  popMatrix();
  noFill();
  stroke(#EA4040);
  strokeWeight(4);
  triangle(0, 0,-a,0,-a,b); 
  popMatrix();
}

void keyPressed() {
  if (key =='a' ) {
    slide++;
  } 
}

