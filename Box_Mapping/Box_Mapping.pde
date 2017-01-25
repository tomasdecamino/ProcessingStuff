void setup() {
  size(640, 360, P3D);
}

void draw() {
  background(0);
  pushMatrix();
  translate(width/2, height/2, -100);
  //rotateX(map(mouseX,0,width,-PI,PI));
  //rotateY(map(mouseY,0,width,-PI,PI));
  strokeWeight(3);
  stroke(255);
  noFill();
  box(200);
  pushMatrix();
  translate(0, 0, 0);
  rotateX(map(mouseX,0,width,-PI,PI));
  rotateY(map(mouseY,0,width,-PI,PI));
  box(30);
  popMatrix();
  popMatrix();
}
