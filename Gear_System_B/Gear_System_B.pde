import controlP5.*;

ControlP5 cp5;

PVector p;
PVector p2;
float a = 0;
ArrayList<Gear> gears = new ArrayList<Gear>();
int selGear=0;
int angle;
int size;
float speed=0.1;


void setup() {

  cp5 = new ControlP5(this);


  cp5.addButton("addGear")
    .setValue(0)
      .setPosition(10, 10)
        .setSize(60, 19)
          ;

  cp5.addButton("removeGear")
    .setValue(0)
      .setPosition(70, 10)
        .setSize(60, 19)
          ;


  cp5.addKnob("angle")
     .setPosition(10,40)
     .setValue(90)
     .setRadius(60)
     .setRange(0,360)
     ;
     
  cp5.addKnob("size")
     .setPosition(10,180)
     .setValue(10)
     .setRadius(60)     
     .setRange(10,500)
     ;   


  cp5.addKnob("speed")
     .setPosition(10,320)
     .setValue(0.05)
     .setRadius(60)     
     .setRange(0,0.5)
     ;  


  size(displayWidth, displayHeight);
  p = new PVector(80, 80, 0);
  p2 = new PVector(155, 80, 0);
  ellipseMode(CENTER);
  smooth();
  gears.add(new Gear(width/2, height/2, 100, 0.2));
  float an=0;
}

void draw() {
  background(#2D64D6);
  noStroke();
  fill(0,30);
  rect(0,0,150,height);
  stroke(255, 200);
  strokeWeight(2);
  fill(255, 70);
  Gear main =gears.get(0);
  main.speed = speed;
  for (int i=0; i<gears.size (); i++) {
    if(selGear!=i){
     Gear part =gears.get(i); 
     part.display();
     part.update();
    }
  }
  Gear part =gears.get(selGear);
  fill(#182AEA, 70); 
  part.displayLine();
  part.update();
  //saveFrame("frames/####.jpg");
}

void mouseClicked() {
  for (int i=0; i<gears.size (); i++) {
    Gear part =gears.get(i); 
    float d = dist(part.pos.x, part.pos.y, mouseX, mouseY);
    if (d<10) selGear=i;
  }
}

public void addGear(int theValue) {
  if (gears.size()>0) {
    gears.add(new Gear(gears.get(selGear), radians(angle), size));
  }
}

public void removeGear(int theValue) {
  if (gears.size()>0) {
    gears.remove(selGear);
    selGear=0;
  }
}

void drawCoordinates(){
  
}

