//Genera un arbol recursivamente
//Tom'as de Camino Beck
import SimpleOpenNI.*;
SimpleOpenNI kinnect;

float xr, yr;

Branch mainBranch;
Branch tmpBranchA;
Branch tmpBranchB;
PVector origin;
PVector attractor;
float ang = radians(25);

void setup() {
  size(displayWidth, displayHeight);
  background(0);
  origin = new PVector(width/2, height-30);
  attractor = new PVector(0, 0);
  mainBranch = new Branch(origin, radians(0), 1); 
  newBranch(mainBranch, 10);
  // rectMode(CENTER);
  cursor(CROSS);
  xr = width/640;
  yr= height/480;
  kinnect = new SimpleOpenNI(this);

  // disable mirror
  kinnect.setMirror(false);

  // enable depthMap generation 
  kinnect.enableDepth();

  // enable skeleton generation for all joints
  kinnect.enableUser(); 
  kinnect.userImage();
}

void draw() {
  kinnect.update();
  int userCount = kinnect.getNumberOfUsers();
  PVector posRealWorld = new PVector();
  PVector posProjected = new PVector();
  PVector hands = new PVector();
  //mainBranch.displayWeight(12);
  for (int userId = 1; userId <= userCount; userId++)
  {
    // lets get user's center of mass coordinates in real world coordinate system
    kinnect.getCoM(userId, posRealWorld);

    // let's convert the center of mass position mapped to 640*480 
    kinnect.convertRealWorldToProjective(posRealWorld, posProjected);

    fill(100, 255, 100);
    point(posRealWorld.x, posRealWorld.y, posRealWorld.z);
    println(posRealWorld.x+","+posRealWorld.y+","+posRealWorld.z);

    //println(posProjected);
    //ellipse(posProjected.x*xr, posProjected.y*yr, 40, 40); 
    attractor.set(posProjected.x*xr, posProjected.y*yr);

    stroke(255, 100);
    strokeWeight(2);
    smooth(8);
    //background(255);
    fill(0, 120);
    rect(0, 0, width, height);
    mainBranch.displayWeight(12);
    //mainBranch.display();
    //attractor.set(mouseX, mouseY);
    //mainBranch.shake(attractor, 200);
    mainBranch.tropism(attractor,300);  
    //mainBranch.stick(attractor);
    //mainBranch.display();
    noFill();
    strokeWeight(3);
    //ellipse(mouseX, mouseY, 400, 400);
    if (mousePressed) {
      saveFrame("frames/####.tif");
    }
  }
  if(userCount==0){
    background(0);
  }
}

//funcion que crea el arbol completo
void newBranch(Branch branch, int i) {
  if (i>0) {
    branch.subBranches(ang, 70);
    i-= 1;
    newBranch(branch.nextBranchA, i);
    newBranch(branch.nextBranchB, i);
  }
}

