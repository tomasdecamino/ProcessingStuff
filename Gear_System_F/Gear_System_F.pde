/**
 
 * Centro de Investigación para la Innovación
 * Universidad Veritas
 * 
 * @author  Tomás de Camino Beck
 * @version 1.0, 05/07/2015
 * 
 */

import controlP5.*;

PImage img;
PImage img1, img2;
PFont font;

ControlP5 cp5;

CheckBox checkbox;

PVector p;
PVector p2;
float a = 0;
ArrayList<Gear> gears = new ArrayList<Gear>();
int maxPoints =300;
ArrayList<PVector> points = new ArrayList<PVector>();

int selGear=0;
int angle;
int size;
float speed=0.01;
String offValue="0.05";
public int parentRod = -1;
public int lengthRod = 300;
int opacity=150;
int selX, selY;
public float jointPos=0.5;
public float offRadi = 0.1;
boolean sel=true;


void setup() {

  font = loadFont("Consolas-48.vlw");
  textFont(font, 20);

  img = loadImage("blueprint.png");

  /********** CONTROLS ****************/

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
    .setPosition(10, 40)
      .setValue(90)
        .setRadius(60)
          .setRange(0, 360)
            ;

  cp5.addKnob("size")
    .setPosition(10, 180)
      .setValue(100)
        .setNumberOfTickMarks(49)
          .snapToTickMarks(true)
            .setRadius(60)     
              .setRange(10, 500)
                ;   


  cp5.addKnob("speed")
    .setPosition(10, 320)
      .setValue(0.05)
        .setRadius(60)     
          .setRange(0, 0.3)
            ;  



  cp5.addButton("offPlus")
    .setValue(0)
      .setPosition(10, 460)
        .setSize(60, 19)
          ;

  cp5.addButton("offMinus")
    .setValue(0)
      .setPosition(70, 460)
        .setSize(60, 19)
          ;

  cp5.addTextfield("offValue")
    .setPosition(10, 480)
      .setValue("0.05")
        .setSize(120, 20)
          .setFont(createFont("arial", 10))
            .setAutoClear(false)
              ;

  cp5.addSlider("opacity")
    .setPosition(10, 520)
      .setRange(0, 255)
        ;

  checkbox = cp5.addCheckBox("checkBox")
    .setPosition(10, 540)
      .setColorForeground(color(120))
        .setColorActive(color(255))
          .setColorLabel(color(255))
            .setSize(10, 10)
              .setItemsPerRow(2)
                .setSpacingColumn(40)
                  .setSpacingRow(20)
                    .addItem("Biela", 0)
                      .addItem("In", 1)
                        ;    

  cp5.addButton("addRod")
    .setValue(0)
      .setPosition(10, 560)
        .setSize(60, 19)
          ;   

  cp5.addNumberbox("parentRod")
    .setPosition(75, 560)
      .setSize(50, 19)
        .setScrollSensitivity(1)
          .setRange(-1, 10)
            .setValue(-1)
              ;
  cp5.addNumberbox("lengthRod")
    .setPosition(75, 600)
      .setSize(50, 19)
        .setScrollSensitivity(10)
          .setRange(1, 800)
            .setValue(300)
              ;

  cp5.addSlider("jointPos")
    .setPosition(10, 640)
      .setRange(0, 1)
        .setValue(0.5)
          ;

  cp5.addSlider("offRadi")
    .setPosition(10, 660)
      .setRange(0, 1)
        .setValue(0.1)
          ;          


  cp5.addButton("addPartL")
    .setValue(0)
      .setPosition(10, 680)
        .setSize(60, 19)
          ; 

  cp5.addButton("addPartR")
    .setValue(0)
      .setPosition(70, 680)
        .setSize(60, 19)
          ;           

  /********** SETUP ****************/
  img1= loadImage("legB.png");
  img2= loadImage("legA.png");


  size(displayWidth, displayHeight);
  p = new PVector(80, 80, 0);
  p2 = new PVector(155, 80, 0);
  ellipseMode(CENTER);
  smooth();
  float an=0;
  selX=width/2;
  selY=height/2;
}

void draw() {
  //background(#2D64D6);
  background(0);
  //tint(255,50);
  //println(checkbox.getValue());
  //image(img, 0, 0, width, height);
  noStroke();
  fill(0, 30);
  rect(0, 0, 150, height);
  stroke(255, 200);
  strokeWeight(2);
  fill(255, 70);
  if (gears.size()>0) {
    for (int i=0; i<gears.size (); i++) {
      Gear part =gears.get(i);
      if (part.parentGear==null)part.speed=speed;
      int col=255;
      if (sel && (selGear==i)) {
        if (part.rod!=null)part.rod.distFromBase=jointPos*part.rod.hyp;
        part.or=part.r*offRadi;
        col =200;
      }
      part.drawGear(col, opacity);     
      if (part.lines!=null) {
        stroke(255, 255, 0, 100);
        strokeWeight(20);
        part.lines.update(part.rod.p2.x, part.rod.p2.y);
        //part.lines.drawImages();
      }
      strokeWeight(10);
      part.update(); 
      text(i, part.pos.x, part.pos.y-part.r+26);
      if (checkbox.getArrayValue()[0]==1) {
        if (part.rod!=null) {
          strokeWeight(10);
          stroke(255, opacity);
          part.drawRod();
          if (part.rod.parent!=null) {
            stroke(255, 0, 0, 30);
            drawTrace(part.rod.parent.p2.x, part.rod.parent.p2.y);
          }
        }
      }
    }
  }
  text("X:"+mouseX, width-150, 20);
  text("Y:"+mouseY, width-70, 20);
  //saveFrame("frames/####.jpg");
}

void mouseClicked() {
  sel=false;
  for (int i=0; i<gears.size (); i++) {
    Gear part =gears.get(i); 
    float d = dist(part.pos.x, part.pos.y, mouseX, mouseY);
    if (d<10) {
      selGear=i;
      sel=true;
    }
  }
  selX=mouseX;
  selY=mouseY;
}



public void addGear(int theValue) {
  if (gears.size()>0 && sel) {
    if (checkbox.getArrayValue()[1]==1) {
      gears.add(new Gear(gears.get(selGear), size));
    }
    else {
      gears.add(new Gear(gears.get(selGear), radians(angle), size));
    }
  }
  else {
    gears.add(new Gear(selX, selY, size, speed));
  }
}

public void removeGear(int theValue) {
  if (gears.size()>0 && sel) {
    gears.remove(selGear);
    selGear=0;
  }
}

void offPlus(int theValue) {
  if (gears.size()>0) {
    Gear part =gears.get(selGear);
    part.gearOffset+=float(offValue);
    part.drawGear(200, opacity);
  }
}

void offMinus(int theValue) {
  if (gears.size()>0) {
    Gear part =gears.get(selGear);
    part.gearOffset-=float(offValue);
    part.drawGear(200, opacity);
  }
  sel=true;
}

public void addRod(int theValue) {
  if (gears.size()>0 && sel) {
    Gear part =gears.get(selGear);
    part.rod=new PLine(part.pos.x+part.r, part.pos.y, lengthRod, lengthRod-10);
    if (parentRod>-1) {
      Gear g =gears.get(parentRod);
      g.rod.distFromBase=300;
      part.rod.setParent(g.rod);
    }
  }
}

void drawTrace(float x, float y) {
  if (points.size()>maxPoints)points.remove(0);
  points.add(new PVector(x, y, 0));
  for (int i = 0; i<points.size();i++) {
    PVector part = points.get(i); 
    point(part.x, part.y);
  }
}

public void addPartR(int theValue) {
  if (gears.size()>0) {
    Gear part =gears.get(parentRod);
    if (part.rod!=null) {
      PCoupledLines lines = new PCoupledLines(selX, selY, 250, 200, false);   
      lines.setImages(img1, img2);
      part.lines=lines;
    }
  }
}

public void addPartL(int theValue) {
  if (gears.size()>0) {
    Gear part =gears.get(parentRod);
    if (part.rod!=null) {
      PCoupledLines lines = new PCoupledLines(selX, selY, 250, 200,true);   
      lines.setImages(img1, img2);
      part.lines=lines;
    }
  }
}