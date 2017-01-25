import processing.serial.*;
Serial port;
PrintWriter output;

float z = 0;
float[] coord = new float[3];
String data="0,0,0";

void setup() {
  size(800, 600, P3D);
  println(Serial.list());
  port = new Serial(this, Serial.list()[5], 9600);
  port.clear();
  port.bufferUntil('\n');
  smooth(8);
  output = createWriter("subject1_broom_acc.txt");
  output.println("MILLIS,X,Y,Z");
}

void draw() {
  fill(0, 100);
  rect(width/2, height/2, width, height);
  pushMatrix();
  line(width/2, height/2, 0, width/2+coord[0]/10, height/2+coord[1]/10, 100+coord[2]/10);
  translate(width/2+coord[0]/10, (height/2+coord[1]/10), 100+coord[2]/10);
  rectMode(CENTER);

  strokeWeight(2);
  stroke(192, 47, 109, 150);

  sphereDetail(5);
  noFill();
  sphere(20);
  popMatrix();
  strokeWeight(2);
  stroke(255);
  line(0, height/2, 0, width, height/2, 0);
  line(width/2, 0, 0, width/2, height, 0);
  pushMatrix();
  translate(width/2, height/2, 100);
  stroke(98, 192, 144, 150);
  box(200);
  popMatrix();
  textSize(26);
  fill(255);
  textSize(32);
  text(data, 10, 30);
  output.print(millis());
  output.print(",");
  output.print(coord[0]);
  output.print(",");
  output.print(coord[1]);
  output.print(",");
  output.println(coord[2]);
}

void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data, ','));
}

void keyPressed() {
  output.flush();  
  output.close();  
  exit();
}

