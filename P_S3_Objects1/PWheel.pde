//Tomas de Camino
class PWheel {
  //wheel at position
  PVector position;
  float angle;
  //rotatin at certain speed
  float angularSpeed;
  int wheelSize;
  // a driver wheel has a child
  PWheel child;
  
  
 /*** Constructors *****/
  PWheel(float x, float y, int size, float speed){
    position = new PVector(x,y,0);
    angularSpeed = speed;
    wheelSize = size;
    ellipseMode(CENTER);
  }
  
  
  void addChild(int size){
    if(child==null){
     child = new PWheel(position.x, position.y+(wheelSize/2+size/2), size, -angularSpeed*(wheelSize/size)); //<>//
    }
  }
  
  
  /****  methods and functions *****/
  void display(){
    pushMatrix(); //<>//
    translate(position.x,position.y);
    rotate(angle); //<>//
    ellipse(0,0,wheelSize,wheelSize);
    line(0,0,0,wheelSize/2);
    popMatrix();
    if(child!=null)child.display();
  }
  
  //updates its positions
  void update(){
    angle+=angularSpeed;
    if(child!=null)child.update();
  }
  
  void set(int x, int y){
    position.x=x;
    position.y=y;
  }
  
}