import processing.video.*; 
import themidibus.*;
import controlP5.*;

ControlP5 cp5;
Capture cam; 
MidiBus myBus; 

float x=0;

int dly=10;
float step = 1/(float)dly;
color c;

int channel = 0;
int pitch = 64;
int velocity = 127;

void setup() {
  size(600, 300);

  cp5 = new ControlP5(this);
  //slider for repultion
  cp5.addSlider("dly")
    .setPosition(5, 5)
      .setRange(1, 20)
        .setColorCaptionLabel(0)
          ;

  cam = new Capture(this);
  cam.start();

  myBus = new MidiBus(this, 0, 1);
}

void draw() {
  step = 1/(float)dly;
  background(0);
  if (cam.available()) { 
    // Reads the new frame
    cam.read();
  } 
  image(cam, 0, 0, 600, 300); 
  loadPixels();
  if (sin(frameCount/dly)>0) {
    if (c!=pixels[(int)x+(height/2)*width]) {
        myBus.sendNoteOff(channel, (int)brightness(c), velocity);
    }
    c = pixels[(int)x+(height/2)*width];
    myBus.sendNoteOn(channel, (int)brightness(c), velocity);
  }
  text( (int)brightness(c), 5, 25);
  fill(c);
  ellipse(x, (height/2), 30, 30);
  stroke(255);
  line(x, 20, x, height);
  x=(x+step)%width;
}

