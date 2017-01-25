//Tomas de Camino Beck

import processing.serial.*;
Serial port;
String data;
float[] val = new float[2];


void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista
  port = new Serial(this, "/dev/ttyUSB0", 9600);
  port.bufferUntil('\n');  
  size(600, 600);
}

void draw() {
  background(255);
  fill(val[0]);
  ellipse(width/2, height/2, val[0], val[0]);
}

void serialEvent(Serial port) {
  data = port.readString();
  String[] list = split(data, ',');
  val[0]=float(list[0]);
  val[1]=float(list[1]);
  
}