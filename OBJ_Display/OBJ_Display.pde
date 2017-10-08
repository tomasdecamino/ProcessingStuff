PShape s;
float mX=94;
int a=300;

void setup() {
  size(500, 500, P3D);
  s = loadShape("sn.obj");
  s.setFill(color(255, 10, 10));
  s.scale(3);
}

void draw() {
  background(0);
  //use lights to create shadows
  lights();
  //camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  
  //draws the obj
  pushMatrix();
  translate(width/2, height/2);
  rotate(PI+HALF_PI);
  // use mouse for rotation
  rotateZ(map(mX, 0, width, -TWO_PI, TWO_PI));
  rotateY(map(mouseX, 0, width, -TWO_PI, TWO_PI));
  rotateX(map(mouseY, 0, height, -TWO_PI, TWO_PI));
  strokeWeight(3);
  //rotating plane
  stroke(255, 0, 0);
  line(-a, 0, 0, a, 0, 0);
  stroke(0, 255, 0);
  line(0, -a, 0, 0, a, 0);
  stroke(0, 0, 255);
  line(0, 0, -a, 0, 0, a); 
  //Draw shape. Translate to center
  translate(0, 20, -50);
  shape(s, 0, 0);
  popMatrix();
  
  //fixed plane
  pushMatrix();
  translate(width/2, height/2);
  stroke(255);
  line(-a, 0, 0, a, 0, 0);
  line(0, -a, 0, 0, a, 0);
  line(0, 0, -a, 0, 0, a); 
  popMatrix();
  
  // use any key for Z rotation
  if (keyPressed) {
    mX+=0.1;
    println(mX);
  }
  if (mousePressed) {
    //saveFrame("frames/####.jpg");
  }
}