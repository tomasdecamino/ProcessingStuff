PShape s;

void setup() {
  s = loadShape("3DScan.obj");
  s.setFill(color(255, 200, 100));
}

void draw() {
  translate(width/2, height/2);
  rotate(PI+HALF_PI);
  rotateZ(map(mouseX, 0, width, -TWO_PI, TWO_PI));
  rotateX(map(mouseY, 0, height, -TWO_PI, TWO_PI));
  shape(s, 0, 0);
}