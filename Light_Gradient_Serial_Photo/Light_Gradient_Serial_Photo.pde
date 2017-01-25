import processing.serial.*;
Serial port;
PImage photo, img0, imgBR, imgBL, imgTR, imgTL;

// magnitude [0] and angle in radians [1]
float[] coord = new float[2];
String data="0,0";
PFont angulo;

void setup()
{
  size(480, 480);
  println(Serial.list());
  port = new Serial(this, Serial.list()[0], 9600);
  port.clear();
  port.bufferUntil('\n');
  ellipseMode(CENTER);
  background(255);
  angulo = loadFont("MyUnderwood-48.vlw");
  ;   
  textFont(angulo, 30);

  img0 = loadImage("img0.JPG");
  imgBR = loadImage("imgBR.JPG");
  imgBL = loadImage("imgBL.JPG");
  imgTR = loadImage("imgTR.JPG");
  imgTL = loadImage("imgTL.JPG");
  photo = img0;
  imageMode(CENTER);
  background(0);
}

void draw()
{
  smooth(8);
  strokeWeight(4);
  image(photo, width/2, height/2);
  noFill();
  stroke(255, int(coord[0])+100);
  arrow(width/2, height/2, coord[0], coord[1]);
  ellipse(width/2, height/2, coord[0]*2+2, coord[0]*2+2);
  stroke(255, 150);
  if (coord[1]>=0) {
    arc(width/2, height/2, 50, 50, 0, coord[1], PIE);
    textAngle(coord[1]);
  } 
  else {
    arc(width/2, height/2, 50, 50, 0, TWO_PI+coord[1], PIE);
    textAngle(TWO_PI+coord[1]);
  }
  checkQuadrant(coord[0], coord[1], 50);
}


void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data, ','));
}


void arrow(int x, int y, float l, float ang) {
  //para determinar el largo de la punta en 45 grados
  int arrowLength = 8;
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

void checkQuadrant(float l, float ang, int th) {
  float x = width/2 + l*cos(ang);
  float y = height/2 + l*sin(ang);
  
  if (abs(x-width/2)>th ||abs(y-height/2)>th) {
    if (y<height/2) {
      if (x<width/2) {
        photo = imgTL;
      }
      else {
        photo = imgTR;
      }
    }
    else {
      if (x<width/2) {
        photo = imgBL;
      }
      else {
        photo = imgBR;
      }
    }
  }
  else {
    photo = img0;
  }
}

