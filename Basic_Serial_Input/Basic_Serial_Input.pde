import processing.serial.*;
Serial port;
String data;

void setup() {
  size(300,300);
  port = new Serial(this, Serial.list()[0], 9600);
  port.clear();
  port.bufferUntil('\n');
}

void draw(){
  float valor =float(data);
  background(map(valor,0,1024,0,255));
}



void serialEvent(Serial port) {
  data = port.readStringUntil('\n');
}
