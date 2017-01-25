//Movers.  Elastic material

class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  PFont letter;
  char character;

  Mover(float m, float x , float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    letter = createFont("Times",m,true);
    character = char(int(random(35, 127)));
    
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    fill(255,int(random(100,255)));
    //ellipse(location.x,location.y,mass*2,mass*2);
    textFont(letter,mass);
    text(character,location.x,location.y);
  }

  PVector repel(Mover m) {
    PVector force = PVector.sub(location,m.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance,1.0,10000.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction
    float strength = 1/(distance * distance);
    //float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(-1*strength);                                      // Get force vector --> magnitude * direction
    return force;
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = width-1;
    } 
    else if (location.x < 0) {
      location.x = 1;

    }

    if (location.y > height) {
      location.y = height-1;

    } 
    else if (location.y < 0) {
      location.y = 1;
    }

  }

}




