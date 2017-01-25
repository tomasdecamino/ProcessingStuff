//Tomas de Camino

//Velocidad angular
float angle=0;
float aVelocity=0;
float aAcceleration=0.0001;

void setup(){
  size(600,600);
  rectMode(CENTER);
  background(255);
}

void draw(){
  fill(255,50);
  translate(width/2,height/2);
  rotate(angle);
  rect(0,0,300,300);
  rotate(PI/4);
  rect(0,0,100,100);
  aVelocity+=aAcceleration;
  angle+=aVelocity;
}