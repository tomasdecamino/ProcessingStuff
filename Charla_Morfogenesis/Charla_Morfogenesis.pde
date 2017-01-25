//@author: Tomas de Camino Beck

import themidibus.*;
import controlP5.*;

MidiBus myBus;
ControlP5 cp5;

int n = 50;
int area, repulsion;

float[][] position=new float[n][2];

void setup() {
  myBus = new MidiBus(this, 0, 1);
  size(displayWidth, displayHeight);//cambiar tamano de pantalla 
  background(255, 255, 255);
  for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
    position[bola][0]= random(0, width);
    position[bola][1]= random(0, height);
  }
  smooth(8);

  cp5 = new ControlP5(this);
  //slider for repultion
  cp5.addSlider("repulsion")
    .setPosition(5, 5)
      .setRange(1, 500)
        .setColorCaptionLabel(0)
          ;

  //slider for area
  cp5.addSlider("area")
    .setPosition(5, 20)
      .setRange(5, 300)
        .setColorCaptionLabel(0)
          ;
}

void draw() {
  background(255, 255, 255);
  //stroke(0, 100, 255, 100);
  strokeWeight(2);
  //noStroke();
  //fill(255, 0, 0,100);
  for (int bola=0;bola<n;bola++) {
    float r=50;//random(5, 300);
    position[bola][0]+=(mouseX-position[bola][0])/r;//X
    position[bola][1]+=(mouseY-position[bola][1])/r;//Y
    for (int j=0;j<n;j++) {
      //calcula la distancia de bola a j
      float d=dist(position[bola][0], position[bola][1], position[j][0], position[j][1]);
      //si la otra boal esta a menos de 10 pixeles y no es ella misma
      if (d<area && bola!=j) {
        myBus.sendNoteOn(0,(int) d, 127); 
        line(position[bola][0], position[bola][1], position[j][0], position[j][1]);
        position[bola][0]+=(position[bola][0]-position[j][0])/repulsion;
        position[bola][1]+=(position[bola][1]-position[j][1])/repulsion;
        myBus.sendControllerChange(0, (int)map(mouseX,0,width,0,127),(int)map(mouseY,0,height,0,127) );
      }
      myBus.sendNoteOff(0,(int) d, 127);
    }
    stroke(0, 0, 0, 100);
    ellipse(position[bola][0], position[bola][1], 40, 40);
  }
  if (keyPressed) {
    for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
      position[bola][0]= random(0, width);
      position[bola][1]= random(0, height);
    }
  }
}

