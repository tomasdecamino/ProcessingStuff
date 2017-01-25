// @author: Tomas de Camino Beck

import processing.serial.*;
Serial port;
String data;
int [] capSense= new int[8];
int slide, buttonLeft, buttonRight;
float light, sound, temp;
float aX, aY, aZ;

PFont font;

int n =1000; //number of points
int len=270; //radius
int m = 1;  //multiplier

void setup() {
  font = loadFont("Courier10PitchBT-Roman-48.vlw");
  textFont(font, 14);
  size(1000, 1000);
  port = new Serial(this, "/dev/ttyACM0", 9600);
  port.bufferUntil('\n');  //clear the buffer


  smooth(8);
}

void draw() {
  m = int(map(aX, -10, 10, 1, 100));
  n = int(map(aY, -10, 10, 10, 500));
  background(255);
  stroke(0, 100);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < n; i++) {
    //calculate first point
    float x = cos(TWO_PI/n*i)*len;
    float y = sin(TWO_PI/n*i)*len;
    strokeWeight(2);
    //draw point
    point(x, y);

    //calculate second point in postion multiplied by m
    //function modulo % to go around
    float x2 = cos(TWO_PI/n*((i*m)%n))*len;
    float y2 = sin(TWO_PI/n*((i*m)%n))*len;
    strokeWeight(1);
    //draw line
    line(x, y, x2, y2);
  }
  popMatrix();
}

void serialEvent(Serial port) {
  //cap3(0),cap2(1),cap0(2),cap1(3),cap12(4),cap6(5),cap9(6),cap10(7),slide(8),
  //button_left(9),button_right(10),light(11),sound(12),X(13),Y(14),Z(15),temp(16)
  data = port.readString();
  String[] list = split(data, ',');
  if (list.length==17) {
    capSense[0]=int(list[0]);
    capSense[1]=int(list[1]);
    capSense[2]=int(list[2]);
    capSense[3]=int(list[3]);
    capSense[4]=int(list[4]);
    capSense[5]=int(list[5]);
    capSense[6]=int(list[6]);
    capSense[7]=int(list[7]);
    slide=int(list[8]);
    buttonLeft=int(list[9]);
    buttonRight=int(list[10]);
    light=float(list[11]);
    sound=float(list[12]);
    aX=float(list[13]);
    aY=float(list[14]);
    aZ=float(list[15]);
    temp=float(list[16]);
  }
}