int x,y;

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  x = width/2;
  y = height/2;
}


void draw() {
  //background(255);
  noFill();
  smooth(8);
  stroke(0, 10);
  if(random(1)>0.9){
    x = x + int(random(-5,5));
    y = y + int(random(-5,5));
    x = constrain(x,0,width);
    y = constrain(y,0,height);
  }
  loopPoint(x,y, 150, random(-3, 3), random(1));

}

void loopPoint(int x, int y, int l, float ang, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(ang);
  beginShape();
  curveVertex(0, 0); 
  curveVertex(0, 0);
  curveVertex(l, l);
  curveVertex(l, -l);    
  curveVertex(0, 0);
  curveVertex(0, 0);   
  endShape();
  popMatrix();
}

void keyPressed() {
  saveFrame();
}

