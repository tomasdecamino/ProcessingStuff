import processing.serial.*;
Serial port;

float z = 0;
float[] coord = new float[1];
String data="0,0,0";
int x,y;


void setup() {
  size(displayWidth,displayHeight);
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  port.clear();
  port.bufferUntil('\n');
  smooth(8);
  x=width/2;
  y = height/2;
}

void draw(){
  point(x,y);
  
}


void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data,','));
}
