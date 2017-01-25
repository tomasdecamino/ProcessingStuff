import processing.serial.*;
Serial port;

float r=95;

void setup() {
  size(600, 600);
  ellipseMode(CENTER);
  smooth(8);
  port = new Serial(this, "/dev/ttyACM0", 9600);
}

void draw() {
  frameRate(10);
  background(255);
  strokeWeight(4);
  stroke(0);
  //draws the 2 arms at center
  drawArm(width/2, height/2, mouseX, mouseY);
  strokeWeight(3);
  float d = dist(width/2, height/2, mouseX, mouseY)*2;
  stroke(0, 100);
  line(width/2, height/2, mouseX, mouseY);
  //drawLine(width/2,height/2,r,map(mouseX,0,width,0,TWO_PI));
  noFill();
  ellipse(width/2, height/2, d, d );
  stroke(255, 10, 10, 150);
  ellipse(width/2, height/2, r*4, r*4);
  line(width/2, 0, width/2, height);
  fill(0);
  text(width/2-mouseX, 10, 10);
  text(height/2-mouseY, 10, 20);
  port.write(nf(width/2-mouseX)+","+nf(height/2-mouseY)+"/n");
  println(nf(width/2-mouseX)+","+nf(height/2-mouseY)+"/n");
}



void drawArm(float x, float y, float xp, float yp) {
  float h2=dist(x, y, xp, yp);
  //calculates angles based on desired point
  float a1 = (getAngle(r, r, h2)-atan2(yp-y, xp-x))+PI;
  float a2 = -(getAngle(h2, r, r));
  drawArm(x, y, r, a1, a2);
}

//draw an a to rod arm with angles given
void drawArm(float x, float y, float h, float a1, float a2) {
  float x1 = x+cos(PI-a1)*h;
  float y1 = y+sin(PI-a1)*h;
  drawLine(x, y, h, PI-a1);
  //change coordinate system to draw second arm
  pushMatrix();
  translate(x1, y1);
  rotate(-a1);
  drawLine(0, 0, h, a2);
  popMatrix();

}

//DRaw a line using origin, angle anf length
void drawLine(float x1, float y1, float h, float a) {
  float x2 = x1+cos(a)*h;
  float y2 = y1+sin(a)*h;
  line(x1, y1, x2, y2);
}

//Function for calculating an angle A
//using law of cosines (a is the opposing side)
float getAngle(float a, float b, float c) {
  return acos((sq(b)+sq(c)-sq(a))/(2*b*c));
}