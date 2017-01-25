//Genera un arbol recursivamente
//Tom'as de Camino Beck

int n = 10;
Branch[] tree = new Branch[n];
PVector[] seeds = new PVector[n];

PVector origin;
PVector attractor;
float ang = radians(15);

void setup() {
  size(displayWidth,displayHeight);
  background(0);
  attractor = new PVector(0, 0);
  for(int i=0; i<n;i++){
      seeds[i] = new PVector(random(width), height);
      tree[i] = new Branch(seeds[i], radians(0), random(10,50));
      createTree(tree[i], 6);
  }
  rectMode(CORNERS);
}

void draw() {
  frameRate(12);
  stroke(0, 100);
  strokeWeight(8);
  smooth(8);
  background(255);
  attractor.set((frameCount*15)%width, 500);
  for(int i = 0; i < n; i++){
    //tree[i].shake(attractor);
   // tree[i].tropism(attractor);
    tree[i].displayWeight(6);
  }
  //mainBranch.display();
  noFill();
  strokeWeight(2);
  //ellipse(mouseX, mouseY, 200, 200);
  //saveFrame();
  //if (mousePressed) {
  //  saveFrame("frames/####.tif");
  //}
}

//funcion que crea el arbol completo
void createTree(Branch branch, int i) {
  if (i>0) {
    branch.subBranches(random(ang), i* random(5,15));
    i-= 1;
    createTree(branch.nextBranchA, i);
    createTree(branch.nextBranchB, i);
  }
}