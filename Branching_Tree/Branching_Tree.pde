//Genera un arbol recursivamente
//Tom'as de Camino Beck

Branch mainBranch;
Branch tmpBranchA;
Branch tmpBranchB;
PVector origin;
PVector attractor;
float ang = radians(70);

void setup() {
  size(displayWidth, displayHeight);
  background(17, 156, 9);
  origin = new PVector(width/2, height/2+80);
  attractor = new PVector(0, 0);
  mainBranch = new Branch(origin, radians(0), 1); 
  newBranch(mainBranch, 12);
 // rectMode(CENTER);
 cursor(CROSS);
}

void draw() {
  frameRate(12);
  stroke(255, 100);
  strokeWeight(2);
  smooth(8);
  //background(255);
  fill(17, 156, 9,120);
  rect(0,0,width,height);
  mainBranch.displayWeight(12);
  //mainBranch.display();
  attractor.set(width/2, height/2);
  mainBranch.shake(attractor,800);
  //mainBranch.tropism(attractor,300);  
  //mainBranch.stick(attractor);
  //mainBranch.display();
  noFill();
  strokeWeight(3);
  //ellipse(mouseX, mouseY, 400, 400);
  //if (mousePressed) {
  //  saveFrame("frames/####.tif");
  //}
  saveFrame("framesTk/####.jpg");
  if(frameCount>=1200)exit();
}

//funcion que crea el arbol completo
void newBranch(Branch branch, int i) {
  if (i>0) {
    branch.subBranches(ang, 50);
    i-= 1;
    newBranch(branch.nextBranchA, i);
    newBranch(branch.nextBranchB, i);
  }
}