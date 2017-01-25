//criaturas que rebotan
//Tom'as de Camino
import hypermedia.video.*;

OpenCV opencv;

int ncrits = 5;
Creature[] crit = new Creature[ncrits];


void setup() {
  size(displayWidth, displayHeight);
  background(255);
  
  opencv = new OpenCV( this );
  opencv.capture(displayWidth/10,displayHeight/10);
  
  
  for (int i = 0; i< ncrits; i++) {
    crit[i] = new Creature(random(width), random(height), int(random(100)), int(random(30)));
    crit[i].velocity.set(0, 0, 0);
  }
}  

void draw() {
  background(255);
  noFill();
  smooth(8);
  //crit.critPosition(mouseX,mouseY);
  //crit.critRotate(0.05);
  for (int i = 0; i< ncrits; i++) {
    crit[i].checkEdges();
    for(int j = 0; j<ncrits; j++){
   // crit[i].critRotate(random(3));
      if(i != j){
        crit[j].update();
        crit[j].attract(crit[i].center.x,crit[i].center.y,800);
        //strokeWeight(3);
        //stroke(80, 60);
        //line(crit[j].center.x,crit[j].center.y,crit[i].center.x,crit[i].center.y);
      }
    }

 opencv.read();           // grab frame from camera
  opencv.threshold(150);    // set black & white threshold 
  //image(opencv.image(), 0, 0 ,160,120);
    // find blobs width*height/2
 // mainBranch.display();
    Blob[] blobs = opencv.blobs( 100, width*height, 1, true,2);
    crit[i].push(blobs[0].points[0].x,blobs[0].points[0].y,100);
    stroke(0, 100);
    strokeWeight(3);
    crit[i].display();
  }
  //ellipse(mouseX,mouseY,100,100);
}

