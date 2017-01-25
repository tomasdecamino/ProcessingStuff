particula p;

void setup(){
  size(600,600);
  PVector ini = new PVector(width/2,50);
  p = new particula(ini);
  background(255);
}

void draw(){
  fill(255,100);
  stroke(0,20);
  p.display(40);
  p.update();
  if(p.position.y>height)p.position.y=0;
}