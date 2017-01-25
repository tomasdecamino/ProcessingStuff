import processing.serial.*;
Serial port;
String data;
float val;


void setup() {
  println(Serial.list());
  port = new Serial(this, Serial.list()[5], 9600);
  port.bufferUntil('\n');  
  size(600, 600);
}

void draw() {
  background(255);
  fill(val);
  ellipse(width/2, height/2, val, val);
}

void serialEvent(Serial port) {
  data = port.readString();
  val = float(data);
}

