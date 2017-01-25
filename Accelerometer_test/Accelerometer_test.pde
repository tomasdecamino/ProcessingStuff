import processing.serial.*;
Serial port;

float z = 0;
float[] coord = new float[3];
String data="0,0,0";

void setup() {
  size(800,600,P3D);
  println(Serial.list());
  port = new Serial(this, Serial.list()[5], 9600);
  port.clear();
  port.bufferUntil('\n');
  smooth(8);
}

void draw() {
  fill(0,100);
  rect(width/2,height/2,width,height);
  pushMatrix();
  translate(width/2,height/2,0);
  rectMode(CENTER);
  rotateX(HALF_PI-coord[0]);
  rotateY(coord[1]);
  //rotateZ(coord[2]);
  //println(data);
  //fill(255,100);
  //noFill();
  strokeWeight(2);
  stroke(210,150);
  //sphereDetail(25);
  noFill();
  sphere(150);
  fill(195,31,73);
  rect(0,0,400,400);
  rotateX(HALF_PI-coord[0]);
  rotateY(HALF_PI-coord[1]);
  rect(0,0,400,400);
  popMatrix();

}

void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data,','));
}
