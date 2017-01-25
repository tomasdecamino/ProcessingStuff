//Ejemplo tomado de Generative Design
//pg. 182

import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;

import processing.serial.*;
Serial port;

float[] coord = new float[2];
String data="0,0";

float posX, posY;

Minim minim;
AudioOutput out;
SawWave square;
LowPassSP   lowpass;

void setup() {
  size(720, 720);

  minim = new Minim(this);
  out = minim.getLineOut(Minim.STEREO, 512);
  square = new SawWave(100, 100, 44100);
  lowpass = new LowPassSP(100, 44100);
  out.addSignal(square);
  out.addEffect(lowpass);

  //noCursor();
  println(Serial.list());
  port = new Serial(this, Serial.list()[5], 9600);
  port.clear();
  port.bufferUntil('\n');
  posX = width/2;
  posY =  height/2;
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
  noStroke();
  posX=width-map(coord[0], -1000, 1000, 0, width);
  posY=height-map(coord[1], -1000, 1000, 0, height);
  lowpass.setFreq(map(coord[1],-1000,1000,0,40));
  square.setFreq(map(coord[0],-1000,1000,30,440));
  background(posX/2, 100, 100);
  fill(posY, 50, 100);
  rect(360, 360, posX+1, posX+1);
}

void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data, ','));
}

