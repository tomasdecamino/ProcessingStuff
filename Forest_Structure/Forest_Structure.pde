// @author: Tomas de Camino Beck

int nTree=3000;

TTree[] tree;

void setup() {
  size(1000, 1000, P3D);
  tree = new TTree[nTree];
  for (int i=0; i<nTree; i++) {
    tree[i] = new TTree(random(-1000, 1000), random(-1000, 1000), 0, (int) random(5, 25), (int)random(2));
  }
  smooth(8);
  rectMode(CENTER);
}

void draw() {
  //rotateY(map(mouseX, 0, width, -TWO_PI, TWO_PI));
  pushMatrix();
  translate(width/2, height/2, 0);
  rotateX(-5);
  rotateZ(-4);
  //rotateX(map(mouseY, 0, height, -TWO_PI, TWO_PI));
  //rotateZ(map(mouseX, 0, width, -TWO_PI, TWO_PI));

  background(#9BC6E8);
  lights();
  spotLight(255, 255, 255, width/2, height/2, 200, 0, -1, 0, -1.2, 1);
  stroke(255);
  fill(150, 255);
  rect(0, 0, 1500, 1500);
  for (int i=0; i<nTree; i++) {
    tree[i].drawTree();
  }
  popMatrix();
   camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  text(map(mouseX, 0, width, -TWO_PI, TWO_PI),10,10);
  //saveFrame("frames/####.jpg");
  if (keyPressed)saveFrame("frames/photo/####.jpg");
}