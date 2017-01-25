// Code made by Tomas de Camino Beck

import processing.serial.*;
Serial port;

// magnitude [0] and angle in radians [1]
float[] coord = new float[2];
String data="0,0";
PFont angulo;

void setup()
{
  size(displayWidth, displayHeight);
  println(Serial.list());
  port = new Serial(this, "/dev/ttyACM0", 9600);
  port.clear();
  port.bufferUntil('\n');
  ellipseMode(CENTER);
  background(255);
  angulo = loadFont("MyUnderwood-48.vlw");
  ;   
  textFont(angulo, 30);
  background(0);
}

void draw()
{
  fill(0, 5);
  rect(-1, -1, width+1, height+1);
  smooth(8);
  strokeWeight(4);
  noFill();

  strokeWeight(3);
  stroke(255, 20);
  ellipse(width/2, height/2, coord[0]*6+2, coord[0]*6+2);
  stroke(255, 150);
  if (coord[1]>=0) {
    arc(width/2, height/2, 200, 200, 0, coord[1], PIE);
    textAngle(coord[1]);
  } else {
    arc(width/2, height/2, 200, 200, 0, TWO_PI+coord[1], PIE);
    textAngle(TWO_PI+coord[1]);
  }
  stroke(255, 0, 0);
  strokeWeight(10);
  arrow(width/2, height/2, coord[0]*3, coord[1]);
}


void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data, ','));
}


void arrow(int x, int y, float l, float ang) {
  //para determinar el largo de la punta en 45 grados
  int arrowLength = 15;
  pushMatrix();
  //cambia el eje del dibujo y lo rota
  translate(x, y);
  rotate(ang);
  //dibuja una linea y flecha en el eje X
  line(0, 0, l, 0);
  line(l, 0, l - arrowLength, -arrowLength);
  line(l, 0, l - arrowLength, arrowLength);
  text(nf(l, 0, 1), l+10, 0);
  popMatrix();
}

void textAngle(float ang) { 
  fill(255, 200);
  pushMatrix();
  translate(width/2, height/2);
  rotate(ang*0.5);
  text(nf(int(degrees(ang)), 0, 0), 30, 0);
  popMatrix();
}