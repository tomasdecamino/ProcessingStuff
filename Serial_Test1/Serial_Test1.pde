//@author> Tomas de Camino
import processing.video.*;
import processing.serial.*;

Capture cam;
Serial port; 
String data;
int scaleX, scaleY;
int lineCount = 2;
int mult =1;

void setup() {

  size(640, 640);
  cam = new Capture(this, 640, 640);
  cam.start();  
  background(255);
  println(Serial.list());
  //port = new Serial(this, Serial.list()[0], 115200);
  scaleX = round(640 / 11);
  scaleY = round(640 / 35);
}

void draw() {
  //read webcam
  if (cam.available() == true) {
    cam.read();
  }
  updateScreen();
    println(data.length());
}

void  displayArray() {
}

color getPixel(int x, int y) {
  return cam.pixels[x+y*640];
}

void updateScreen() {
  //scaleX = round(640 / 12);
  //scaleY = round(480 / 18);
  lineCount = 2;
  //int mult =1;
  data="";
  for (int j=1;j<640;j+=scaleY) {
    if (lineCount==0) {
      mult=1;
      lineCount=1;
    }
    else {
      mult=2;
      lineCount=(lineCount+1)%3;
    }
    //println(mult);
    for (int i = 1;i<640;i+=(scaleX*mult)) {
      color c = getPixel(i, j);
      data+=hex(c, 6);
      fill(c);
      ellipse(i, j, scaleX*mult, scaleY);
    }
    //println(lineCount);
  }
  lineCount=0;
  //println(data.length());
  //  port.write(data);
  //  port.write('\n');
}

