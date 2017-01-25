//Tomas de Camino
PWheel driver;

void setup(){ 
  size(600,600);
  driver= new PWheel(width/2,height/2,100,0.05);
  //creates a child
  driver.addChild(40);
  smooth();
}

void draw(){
  background(255);
  driver.display();
  driver.update();
  
}