import processing.serial.*;
Serial port;

float[] coord = new float[2];
String data="0,0";
float m, s;

void setup()
{
  size(700, 700);
  println(Serial.list());
  port = new Serial(this, Serial.list()[3], 9600);
  port.clear();
  port.bufferUntil('\n');

}

void draw()
{
  fill(0,30);
  rect(-10,-10,width+10,height+10);
  //background(0);
  s=coord[1];
  println(s);
  fill(s*255,(1-s)*255,0,200);
  rect(width/2+100,height-10,-200,-s*(height-10));
  //text(sL,10,10);
}


void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data,','));
}



