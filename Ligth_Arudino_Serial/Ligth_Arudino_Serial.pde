import processing.serial.*;
Serial port;

float[] coord = new float[4];
//float x1, x2, y1, y2, pX, pY;
float pX, pY;
String data="0,0,0,0";

void setup()
{
  size(500, 500);
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  port.clear();
  port.bufferUntil('\n');
  ellipseMode(CENTER);
  background(255);
}

void draw()
{
 
  stroke(255,50);
  fill(255, 1);
  rect(0, 0, width, height);
  smooth(8);
  setPosition();
  int red = int(random(255));
  int green = int(random(255));
  int blue = int(random(255));
  fill(red,green,blue, 150);
  float r = random(100);
  stroke(200,50);
  line(width/2,height/2,width/2+pX, height/2+pY);
  ellipse(width/2+pX, height/2+pY, r, r);
  if(mousePressed){
    saveFrame("frame-######.jpg");
  }
}


void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data,','));
}


void setPosition() {
  pX = coord[0] - coord[1];
  pY = coord[2] - coord[3];
}

