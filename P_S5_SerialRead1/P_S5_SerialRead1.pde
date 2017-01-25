//Tomas de Camino Beck

import processing.serial.*;
Serial port;
String data;
float[] val = new float[2];


void setup() {
  println(Serial.list());
  //Seleccionar puerto de la lista
  port = new Serial(this, "/dev/ttyACM0", 9600);
  port.bufferUntil('\n');  //clear the buffer
  size(600, 600);
  background(255);
}

void draw() {
  
  fill(val[0],val[1],255,200);
  ellipse(map(val[0],0,1023,600,0), map(val[1],0,1023,600,0),100,100);
}

void serialEvent(Serial port) {
  data = port.readString();
  String[] list = split(data, ',');
  val[0]=float(list[0]);
  val[1]=float(list[1]);
  
}