class PRobot {
  float v=8;
  float dir=0;
  PVector pos;

  PRobot(float x, float y) {
    this.pos = new PVector(x, y);
  }

  void move() {
    float vx= cos(dir)*v;
    float vy= sin(dir)*v;
    pos.add(vx, vy, 0);
  }

  void sense(color c) {
    if (c==-1) {
      dir-=random(-HALF_PI+1.5,HALF_PI+1.5);
    }
  }

  void drawBot() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(dir);
    fill(255, 0, 0, 200);
    ellipse(0, 0, 80, 80);
    fill(0, 255, 0, 100);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }
}