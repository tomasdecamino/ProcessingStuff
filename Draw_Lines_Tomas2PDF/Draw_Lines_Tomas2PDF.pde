ArrayList<PVector> pincel = new ArrayList<PVector>();
int x,y;
void setup() {
  size(displayWidth,displayHeight);
  mouseX=width/2;
  mouseY=height/2;
  x=0;
  y=height/2;
  
  for (int i=0;i<7;i++) {
    pincel.add(new PVector(x, y, 0));
  }
  background(0);
}

void draw() {
  frameRate(10);
  fill(random(255),random(255),random(255),150);
  strokeWeight(1);
  beginShape();
  vertex(pincel.get(0).x,pincel.get(0).y);
  bezierVertex(pincel.get(1).x,pincel.get(1).y,
               pincel.get(2).x,pincel.get(2).y, 
               pincel.get(3).x,pincel.get(3).y);
  bezierVertex(pincel.get(4).x,pincel.get(4).y,
               pincel.get(5).x,pincel.get(5).y, 
               pincel.get(6).x,pincel.get(6).y);
  endShape();
  int r = 60;
  beginShape();
 // fill(255);
 // text((int)pincel.get(2).x,pincel.get(2).x,pincel.get(2).y);
 // text((int)pincel.get(2).y,pincel.get(2).x+30,pincel.get(2).y);
  vertex(pincel.get(2).x,pincel.get(2).y);
  bezierVertex(pincel.get(3).x+random(-r,r),pincel.get(3).y+random(-r,r),
               pincel.get(4).x+random(-r,r),pincel.get(4).y+random(-r,r), 
               pincel.get(5).x+random(-r,r),pincel.get(5).y+random(-r,r));
  endShape();
  
  pincel.remove(0);
  pincel.add(new PVector(x, y, 0));
}

