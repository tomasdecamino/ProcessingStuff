import controlP5.*;
ControlP5 cp5;

PLine rod1, rod2;

PCoupledLines cl;

float x1, y1, x2, y2;
float ang1 = 0;
float ang2 = 0;
float r1, r2;
int opacity=70;
int joint=100;

int maxPoints =610;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup() {

  cp5 = new ControlP5(this);

  cp5.addSlider("joint")
    .setPosition(10, 10)
      .setValue(150)
        .setRange(0, 300)
          ;

  cp5.addSlider("r2")
    .setPosition(10, 30)
      .setValue(50)
        .setRange(1, 400)
          ; 

  cp5.addSlider("r1")
    .setPosition(10, 50)
      .setValue(50)
        .setRange(1, 400)
          ;       


  size(800, 800);
  r1=50;
  x1=width/2+100;
  y1=height/2+200;
  r2=50;
  x2=width/2-100;
  y2=y1;  
  rod1 = new PLine(x1+cos(ang1)*r1, y1+sin(ang1)*r1, 300, 150);
  rod2 = new PLine(x2+cos(ang2)*r2, y2+sin(ang2)*r2, 300, 100);
  rod2.setParent(rod1);
  //rod1.moveTo(width/2-10, height/2);

  cl = new PCoupledLines(width/2,50,400,300);
   
  ellipseMode(CENTER);
  background(255);
}


void draw() {
  rod1.distFromBase=joint;
  background(255);
  stroke(0, opacity);
  strokeWeight(10);
  ellipse(x1, y1, r1*2, r1*2);
  ellipse(x2, y2, r2*2, r2*2);
  rod1.moveLine(x1+cos(ang1)*r1, y1+sin(ang1)*r1);
  stroke(0, opacity);
  strokeWeight(10);
  fill(0, opacity);
  rod2.pullParent(x2+cos(ang2)*r2, y2+sin(ang2)*r2);
  rod2.drawLine();
  rod1.drawLine();
  text("p1", rod1.p1.x, rod1.p1.y-10);
  text("p2", rod1.p2.x, rod1.p2.y-10);
  text("p1", rod2.p1.x, rod2.p1.y-10);
  text("p2", rod2.p2.x, rod2.p2.y-10);
  stroke(#727FF0, opacity+50);
  strokeWeight(30);
  cl.update(rod1.p2.x, rod1.p2.y);
  strokeWeight(10);
  stroke(255, 0, 0, opacity);
  point(rod1.pm.x, rod1.pm.y);
  stroke(255, 0, 0, 50);  
  point(rod1.p2.x, rod1.p2.y);
  stroke(0, 150);  
  point(rod1.p2.x, rod1.p2.y);  
  point(rod1.p2.x, rod1.p2.y);
  stroke(255, 0, 0, 50);
  strokeWeight(2);
  ang1+=0.02;
  ang2-=0.02*(r1/r2);
  if (points.size()>maxPoints)points.remove(0);
  points.add(new PVector(rod1.p2.x, rod1.p2.y, 0));
  for (int i = 0; i<points.size();i++) {
    PVector part = points.get(i); 
    point(part.x, part.y);
  }
  //saveFrame("frames/####.jpg");
}

void keyPressed() {  
  if (key =='a' ) {
    ang1+=0.04;
  } 
  if (key =='s' ) {
    ang2+=0.04;
  }
}

