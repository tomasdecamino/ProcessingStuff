class particula {
  PVector position;
  PVector velocity;
  PVector acceleration;

  particula(PVector initial) {
    position = initial.get();
    velocity = new PVector(random(-1, 1), random(-1, 1));
    acceleration = new PVector(0, 0.005);
  }
  
  void update(){
    position.add(velocity);
    velocity.add(acceleration);
  }
  
  
  void display(int size){
    ellipse(position.x, position.y,size,size);
  
  }
}