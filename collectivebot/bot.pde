class bot {
  PVector position;
  PVector velocity;
  int s = 20; //size of the bot
  int n = 1;//numero de contactos
  int state = 0; //estado
  bot(PVector pos, int size) {
    velocity = new PVector(random(-5, 5), random(-5, 5), 0);
    position = pos;
    s = size;
  }


  void display() {
    ellipse(position.x, position.y, 20, 20);
  }

  void displayUpdateRandom(float l) {
    float rX = random(-l, l);
    float rY = random(-l, l);
    position.add(rX, rY, 0);
    if (position.x>width)position.x=0;
    if (position.x<0)position.x=width;
    if (position.y>height)position.y=0;
    if (position.y<0)position.y=height;
    strokeWeight(s);
    // stroke(n, 111);
    point(position.x, position.y);
  }

  void displayUpdate() {
    position.add(velocity);
    if (position.x>width)position.x=0;
    if (position.x<0)position.x=width;
    if (position.y>height)position.y=0;
    if (position.y<0)position.y=height;
    strokeWeight(s);
    stroke(0, 0, 0, 150);
    // stroke(n, 111);
    point(position.x, position.y);
  }

  void displayUpdateAlter() {
    velocity.add(random(-0.1, 0.1), random(-0.1, 0.1), 0);
    position.add(velocity);
    if (position.x>width)velocity.x*=-1;
    if (position.x<0)velocity.x*=-1;
    if (position.y>height)velocity.y*=-1;
    if (position.y<0)velocity.y*=-1;
    strokeWeight(n);
    stroke(0, 0, 0, 150);
    // stroke(n, 111);
    point(position.x, position.y);
  }

  void resetVelocity() {
    velocity.set(random(-5, 5), random(-5, 5), 0);
  }
}

