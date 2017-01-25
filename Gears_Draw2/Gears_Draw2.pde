import processing.pdf.*;

float a = 0;
float a2 = 0;
float speed=0.01;
int r1=40;
int r2=40;
int th=15;


void setup() {
  size(600, 600);//,PDF, "gear8.pdf");
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully

  ellipseMode(CENTER);
} 

void draw() {
  background(#2D64D6);
  noFill();
  stroke(255,100);
  int posX=width/2-r1;
  int posY =height/2;
  a+=speed;
  a2-=(speed*r1/r2);
  float rel = float(r1)/float(r2);
  println(th/(2*rel));
  float mp= map(mouseX,0,width,0,PI);
  drawGear(r1, posX, posY, th,a);
  //drawGear(r2, posX+r1+r2+th, posY, th,a2);
  //text(mp,10,10);
  //exit();
}



void drawGear(int radio, float centerPositionX, float centerPositionY, float teethHeight, float rotationSpeed )
{ 
  //float rotationAngle=map(mouseX, 0, width, 0, TWO_PI ); 
  int numberOfTeeth=radio/5; 
  //numberOfTeeth=constrain(numberOfTeeth, minNumberOfTeeth, maxNumberOfTeeth);
  float teethAngle=TWO_PI/numberOfTeeth;
  float teethWidth=sin(teethAngle/2)*radio; 
  float lineY=cos(teethAngle/2)*radio+teethHeight;
  pushMatrix();
  translate(centerPositionX, centerPositionY);
  rotate(rotationSpeed);
  fill(255);
  stroke(255,150);
  for (int i=0; i<numberOfTeeth; i++)
  {  
    rotate(teethAngle); 
    strokeWeight(1);
    triangle(-3*teethWidth/4, -lineY+teethHeight, teethWidth/2, -lineY+teethHeight, -teethWidth/2, -lineY);
    triangle(teethWidth/4, -lineY, -teethWidth/2, -lineY, teethWidth/2, -lineY+teethHeight);
  } 
  fill(255,150);
  ellipse(0, 0, 2*(-lineY+teethHeight), 2*(-lineY+teethHeight)) ;

  popMatrix();
}



