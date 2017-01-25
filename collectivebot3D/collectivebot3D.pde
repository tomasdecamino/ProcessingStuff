import themidibus.*;
import controlP5.*;

ControlP5 cp5;
MidiBus myBus; 

int nBots =50;
int ef =100;
int area =500;
bot[] manyBots = new bot[nBots];

void setup() {
  myBus = new MidiBus(this, 0, 1);
  
  cp5 = new ControlP5(this);
  //slider for repultion
    cp5.addSlider("ef")
     .setPosition(5,5)
     .setRange(1,1000)
     .setColorCaptionLabel(255)
     .setColorForeground(color(255))
     ;
     
  //slider for area
      cp5.addSlider("area")
     .setPosition(5,20)
     .setRange(10,1000)
     .setColorCaptionLabel(255)
     ;
  

  size(displayWidth, displayHeight,P3D);
  for (int i=0;i<nBots;i++) {
    manyBots[i] = new bot(new PVector(random(50, width-50), random(50, height-50),  -random(500, 1500)),20);
  }
  smooth();
      textSize(24);
}

void draw() {
  frameRate(30);
camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 1);

  background(10);
  noStroke();
  //lights();
  //directionalLight(165, 224, 63, 1, 0, -1);
  spotLight(255, 255, 255, mouseX, mouseY, 400, 0, 0, -1, PI, 2);
  pushMatrix();
  noFill();
  translate(width/2,height/2,-100);
  for(int i=0;i<1500;i+=250){
    stroke(255, 255, 255, 100-100*i/1500); 
    box(width-50,height-50,-i);
  }
  popMatrix();
  for (int i=0;i<nBots;i++) {
    float d =dist(manyBots[i].position.x, manyBots[i].position.y, mouseX, mouseY);
   /* if (d<100) {
      manyBots[i].velocity.mult(-1);
    }*/
    manyBots[i].n=1;
    for (int j=i+1;j<nBots;j++) {
      float d2 =dist(manyBots[i].position.x, manyBots[i].position.y,manyBots[i].position.z, manyBots[j].position.x, manyBots[j].position.y,manyBots[j].position.z);
      strokeWeight(1);
      if (d2<area) {
        stroke(242, 156, 136, 95);
        myBus.sendNoteOn(0, (int)d2*4, 127);
        line(manyBots[i].position.x, manyBots[i].position.y,manyBots[i].position.z, manyBots[j].position.x, manyBots[j].position.y,manyBots[j].position.z);
        manyBots[i].velocity.add(manyBots[j].velocity.x*d2/ef,manyBots[j].velocity.y*d2/ef,manyBots[j].velocity.z*d2/ef);
        manyBots[i].n++;
        manyBots[j].n++;
      }
    }
    fill(255);
    text(manyBots[i].n,manyBots[i].position.x-5, manyBots[i].position.y, manyBots[i].position.z);
    manyBots[i].velocity.div(manyBots[i].n);
    manyBots[i].displayUpdateAlter();
    //if (frameCount%100==0)manyBots[i].resetVelocity();
  }

  //if(frameCount%100==0)saveFrame("frames/####.jpg");
  saveFrame("frames/####.jpg");
  //if (frameCount>=500)exit();
  if (keyPressed)saveFrame("frames/####.jpg");
}

