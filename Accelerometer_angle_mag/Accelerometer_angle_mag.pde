import processing.serial.*;
Serial port;
PrintWriter output;

// magnitude [0] and angle in radians [1]
float[] coord = new float[2];
String data="0,0";
PFont angulo;
float ang, mag;

void setup()
{
  size(700, 700);
  println(Serial.list());
  port = new Serial(this, Serial.list()[5], 9600);
  port.clear();
  port.bufferUntil('\n');
  ellipseMode(CENTER);
  background(255);
  angulo = loadFont("MyUnderwood-48.vlw");;   
  textFont(angulo,30);
  output = createWriter("positions_log.txt");

}

void draw()
{
  smooth(8);
  strokeWeight(4);
  background(0);
  noFill();
  mag = sqrt(sq(coord[0])+sq(coord[1]));
  ang = atan2(coord[1],coord[0]);
  stroke(255,int(mag)+100);
  arrow(width/2,height/2,mag/2,ang);
  ellipse(width/2,height/2,mag+2,mag+2);
 stroke(255,150);
  if(coord[1]>=0){
    arc(width/2,height/2,50,50,0,ang,PIE);
    textAngle(ang);
  } else{
    arc(width/2,height/2,50,50,0,TWO_PI+ang,PIE);
    textAngle(TWO_PI+ang);  
  }
 output.println(mag);
 
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
