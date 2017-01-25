//Genera un arbol recursivamente
//Tom'as de Camino Beck

import hypermedia.video.*;


OpenCV opencv;


Branch mainBranch;
Branch tmpBranchA;
Branch tmpBranchB;
PVector origin;
PVector attractor;
float ang = radians(30);

void setup() {
  size(displayWidth, displayHeight);
  opencv = new OpenCV( this );
  opencv.capture(displayWidth/10,displayHeight/10);
  background(0);
  origin = new PVector(width/2, height);
  //attractor = new PVector(0, 0);
  mainBranch = new Branch(origin, radians(0), 320); 
  newBranch(mainBranch, 11);
  rectMode(CORNERS);
}

void draw() {
  frameRate(15);
  stroke(0, 100);
  strokeWeight(2.5);
  smooth(8);
  background(200);
  opencv.read();           // grab frame from camera
  opencv.threshold(190);    // set black & white threshold 
  //image(opencv.image(), 0, 0 ,160,120);
    // find blobs width*height/2
 // mainBranch.display();
  Blob[] blobs = opencv.blobs( 100, width*height, 1, true,2);
  PVector[] attractor = new PVector[blobs.length];
  for( int i=0; i<blobs.length; i++ ) {
    attractor[i] = new PVector(blobs[i].points[0].x *10, blobs[i].points[0].y * 10);
    //mainBranch.shake(attractor[i]);
    mainBranch.tropism(attractor[i],210);
        
    }
 mainBranch.display();
  //mainBranch.display();
  //attractor.set(mouseX, mouseY);
  //mainBranch.shake(attractor);
  //mainBranch.tropism(attractor);  
  //mainBranch.stick(attractor);
  //mainBranch.display();
  noFill();
  strokeWeight(2);
 // ellipse(mouseX, mouseY, 200, 200);
}

//funcion que crea el arbol completo
void newBranch(Branch branch, int i) {
  if (i>0) {
    branch.subBranches(ang, 45);
    i-= 1;
    newBranch(branch.nextBranchA, i);
    newBranch(branch.nextBranchB, i);
  }
}

