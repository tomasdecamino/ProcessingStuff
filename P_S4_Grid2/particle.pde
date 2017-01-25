class particle {
  PVector position; 
  float angularVelocity;
  float h;
  float dx, dy;

  particle(float x, float y, float hyp, float a, float av) {
    position = new PVector(x, y, a) ;
    angularVelocity=av;
    h=hyp;
  }

  void updateDraw() {
    position.z+=angularVelocity;
    dx=sin(position.z)*h;
    dy=cos(position.z)*h;
    pushMatrix();
    translate(position.x, position.y);
    strokeWeight(1);
    stroke(0, 50);
   // ellipse(0, 0, h*2, h*2);
    stroke(0, 150);
    line(0, 0, dx, dy);
    stroke(0, 100);
    strokeWeight(2);
   // point(dx, dy);
    popMatrix();
  }
}