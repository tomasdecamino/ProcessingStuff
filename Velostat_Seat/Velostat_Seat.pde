import processing.serial.*;
Serial port;
float[] coord = new float[14];
String data="0,0,0,0,0,0,0,0,0,0,0,0,0,0";
float d;
double lastMillis=millis();
int min=980;


void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data, ','));
}


void setup() {
  println(Serial.list());
  port = new Serial(this, Serial.list()[5], 9600);
  port.clear();
  port.bufferUntil('\n');
  size(displayWidth, displayHeight);
  d = height/10;
}

void draw() {
  background(0);
  //fill(0, 10);
  //rect(0, 0, width, height);
  //strokeWeight(height/7);
  for (int i=0; i<7;i++) {
    //println(coord[i]);
    float c=constrain(map(coord[i], min, 1023, 0, 0.5), 0, 0.5);
    for (int j = 7; j<14;j++) {
      float c2=constrain(map(coord[j], min, 1023, 0, 0.5), 0, 0.5);
      c2+=c; 
      fill(c2*255,40,50, 255);
      stroke(255, 255);
      ellipse(300+(14-j)*d,150+i*d, d,d);
    }
  }
}

