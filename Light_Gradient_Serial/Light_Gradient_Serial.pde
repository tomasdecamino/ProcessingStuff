// Code made by Tomas de Camino Beck

import processing.serial.*;
Serial port;

// magnitude [0] and angle in radians [1]
float[] coord = new float[2];
String data="0,0";
PFont angulo;

void setup()
{
  size(700, 700);
  println(Serial.list());
  port = new Serial(this,"/dev/tty.usbmodem14241", 9600);
  port.clear();
  port.bufferUntil('\n');
  ellipseMode(CENTER);
  background(255);
  angulo = loadFont("MyUnderwood-48.vlw");;   
  textFont(angulo,30);

}

void draw()
{
  smooth(8);
  strokeWeight(4);
  background(0);
  noFill();
  stroke(255,int(coord[0])+100);
  arrow(width/2,height/2,coord[0]*2,coord[1]);
  ellipse(width/2,height/2,coord[0]*4+2,coord[0]*4+2);
 stroke(255,150);
  if(coord[1]>=0){
    arc(width/2,height/2,50,50,0,coord[1],PIE);
    textAngle(coord[1]);
  } else{
    arc(width/2,height/2,50,50,0,TWO_PI+coord[1],PIE);
    textAngle(TWO_PI+coord[1]);  
  }

 
}


void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data,','));
}


void arrow(int x, int y, float l, float ang){
  //para determinar el largo de la punta en 45 grados
  int arrowLength = 8;
  pushMatrix();
  //cambia el eje del dibujo y lo rota
  translate(x, y);
  rotate(ang);
  //dibuja una linea y flecha en el eje X
  line(0,0,l, 0);
  line(l, 0, l - arrowLength, -arrowLength);
  line(l, 0, l - arrowLength, arrowLength);
  text(nf(l,0,1),l+10,0);
  popMatrix();
}

void textAngle(float ang){ 
  fill(255,200);
  pushMatrix();
  translate(width/2,height/2);
  rotate(ang*0.5);
  text(nf(int(degrees(ang)),0,0),30,0);
  popMatrix(); 
}