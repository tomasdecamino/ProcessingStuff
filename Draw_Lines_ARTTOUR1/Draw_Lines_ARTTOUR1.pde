ArrayList<PVector> pincel = new ArrayList<PVector>();
ArrayList<PVector> pincel2 = new ArrayList<PVector>();

int pt1x=750;
int pt1y=500;
int pt2x=300;
int pt2y=250;

PVector point1  = new PVector(pt1x, pt1y, 0);
PVector point2  = new PVector(pt2x, pt2y, 0);
float ang1=0;
float l1=0;
float ang2=0.3;
float l2=0;


void setup() {
  size(displayWidth, displayHeight);
  mouseX=width/2;
  mouseY=height/2;
  for (int i=0;i<7;i++) {
    pincel.add(new PVector(point1.x, point1.y, 0));
    pincel2.add(new PVector(point2.x, point2.y, 0));
  }
  background(0);
}

void draw() {
  frameRate(30);
  fill(random(255), random(255), random(255), 150);
  strokeWeight(1);
  println(key);
  if (keyPressed) {
    if (keyPressed & key=='a') {
      drawShape1();
    }
    if (keyPressed & key=='s') {
      drawShape2();
    }
    if (keyPressed & key=='d') {
      drawShape1();
      drawShape2();
    }
  }
  else {
    background(0); 
    for (int i=0;i<7;i++) {
      point1.x=pt1x;
      point1.y=pt1y;
      point2.x=pt2x;
      point2.y=pt2y;      
      pincel.remove(i);
      pincel2.remove(i);
      pincel.add(new PVector(point1.x, point1.y, 0));
      pincel2.add(new PVector(point2.x, point2.y, 0));
      ang1=0;
      l1=0;
      ang2=0.3;
      l2=0;
      fill(255, 0, 0, 100);
      ellipse(pt1x, pt1y, 75, 75);
      ellipse(pt2x, pt2y, 75, 75);
    }
  }
  //drawShape2();
}

void drawShape1() {
  beginShape();
  vertex(pincel.get(0).x, pincel.get(0).y);
  bezierVertex(pincel.get(1).x, pincel.get(1).y, 
  pincel.get(2).x, pincel.get(2).y, 
  pincel.get(3).x, pincel.get(3).y);
  bezierVertex(pincel.get(4).x, pincel.get(4).y, 
  pincel.get(5).x, pincel.get(5).y, 
  pincel.get(6).x, pincel.get(6).y);
  endShape();
  int r = 100;
  beginShape();
  stroke(255);
  //fill(255);
  //text((int)pincel.get(2).x,pincel.get(2).x,pincel.get(2).y);
  //text((int)pincel.get(2).y,pincel.get(2).x+30,pincel.get(2).y);
  vertex(pincel.get(2).x, pincel.get(2).y);
  bezierVertex(pincel.get(3).x+random(-r, r), pincel.get(3).y+random(-r, r), 
  pincel.get(4).x+random(-r, r), pincel.get(4).y+random(-r, r), 
  pincel.get(5).x+random(-r, r), pincel.get(5).y+random(-r, r));
  endShape();

  pincel.remove(0);
  pincel.add(new PVector(point1.x, point1.y, 0));
  ang1+=0.1;
  l1+=0.1;
  point1.add(l1*sin(ang1), l1*cos(ang1), 0);
}

void drawShape2() {
  beginShape();
  vertex(pincel2.get(0).x, pincel2.get(0).y);
  bezierVertex(pincel2.get(1).x, pincel2.get(1).y, 
  pincel2.get(2).x, pincel2.get(2).y, 
  pincel2.get(3).x, pincel2.get(3).y);
  bezierVertex(pincel2.get(4).x, pincel2.get(4).y, 
  pincel2.get(5).x, pincel2.get(5).y, 
  pincel2.get(6).x, pincel2.get(6).y);
  endShape();
  int r = 60;
  beginShape();
  stroke(255);
  //fill(255);
  //text((int)pincel.get(2).x,pincel.get(2).x,pincel.get(2).y);
  //text((int)pincel.get(2).y,pincel.get(2).x+30,pincel.get(2).y);
  vertex(pincel2.get(2).x, pincel2.get(2).y);
  bezierVertex(pincel2.get(3).x+random(-r, r), pincel2.get(3).y+random(-r, r), 
  pincel2.get(4).x+random(-r, r), pincel2.get(4).y+random(-r, r), 
  pincel2.get(5).x+random(-r, r), pincel2.get(5).y+random(-r, r));
  endShape();

  pincel2.remove(0);
  pincel2.add(new PVector(point2.x, point2.y, 0));
  ang2-=0.1;
  l2+=0.08;
  point2.add(l2*sin(ang2), l2*cos(ang2), 0);
}

