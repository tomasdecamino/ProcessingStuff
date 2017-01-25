class bot {
  PVector position;
  PVector velocity;
  int s = 20; //size of the bot
  int n = 1;//numero de contactos
  int state = 0; //estado
  bot(PVector pos, int size) {
    velocity = new PVector(random(-5, 5), random(-5, 5), random(-1, 1));
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
    if (position.z<-1)position.z=-1;
    if (position.z>1)position.z=1;
    strokeWeight(s);
    stroke(0, 0, 0, 150);
    // stroke(n, 111);
    point(position.x, position.y);
  }

  void displayUpdateAlter() {
    velocity.add(random(-0.1, 0.1), random(-0.1, 0.1), random(-0.1, 0.1));
    position.add(velocity);
    if (position.x>width-50)velocity.x*=-1;
    if (position.x<50)velocity.x*=-1;
    if (position.y>height-50)velocity.y*=-1;
    if (position.y<50)velocity.y*=-1;
    if (abs(position.z)<500)velocity.z*=-1;
    if (abs(position.z)>1500)velocity.z*=-1;
    strokeWeight(3);
    fill(211,88,28,200);
    stroke(85, 157, 33, 150);
    noStroke();
    pushMatrix();
    translate(position.x, position.y, position.z);
    //rotate(random(-PI, PI));
    sphereDetail(15);
    sphere(s*n);
    popMatrix();
  }

  void resetVelocity() {
    velocity.add(random(-0.05, 0.05), random(-0.05, 0.05), random(-0.05, 0.05));
  }
}

