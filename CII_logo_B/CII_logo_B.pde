//Tomas de Camino Beck
//sorry no comments but code is simple

import controlP5.*;

ControlP5 cp5;
PImage img;
int s = 2;
float repulsion =0.09;
int area=100;

int numAtoms;
particula[] atoms;
int count =0;
int imgScale=1;

void setup() {
  cp5 = new ControlP5(this);
  //slider for repultion
    cp5.addSlider("repulsion")
     .setPosition(5,5)
     .setRange(0,1)
     .setColorCaptionLabel(0)
     ;
     
  //slider for area
      cp5.addSlider("area")
     .setPosition(5,20)
     .setRange(10,1000)
     .setColorCaptionLabel(0)
     ;
  
  
  
  rectMode(CENTER);
  ellipseMode(CENTER);
  img = loadImage("planeta.jpg");
  size(960, 540);
  image(img, 0, 0,width,height); 
  numAtoms = (width * height)/(s*s);
  atoms =new particula[numAtoms];
  loadPixels();
  color c = pixels[0];
  for (int i = 0; i < width; i= i+s) {
    for (int j = 0; j < height; j= j+s) {
      int loc = i + (j * width) ;
      if (pixels[loc]!=c) {
        //fill(pixels[loc], 100);
        atoms[count]=new particula(i, j);
        atoms[count].pColor=pixels[loc];
        count++;
      }
    }
  }
  background(0);
  println(count);
  //noCursor();
  smooth();
  size(width*imgScale,height*imgScale);
}

void draw() {
  frameRate(30);
 // background(255);
  for (int i = 0; i < count; i++) {
    //noFill();
    fill(0,100);
    //fill(atoms[i].pColor);
    stroke(atoms[i].pColor,150);
    strokeWeight(1);
    //noStroke();
    if (mousePressed) {
      atoms[i].update(mouseX/imgScale, mouseY/imgScale, area, repulsion);
    }
    else {
      atoms[i].updateAttract(mouseX/imgScale, mouseY/imgScale, 0,0.008);
    }
    pushMatrix();
    scale(imgScale);
    atoms[i].displayRect();
    popMatrix();
 }  

    //saveFrame("frames/mov/####.jpg");
}