particula tomas;

void setup(){
  size(300,300);
  PVector ini = new PVector(width/2,height/2);
  tomas = new particula(ini);
  
}

void draw(){
  tomas.display();
  tomas.update();
  
}
