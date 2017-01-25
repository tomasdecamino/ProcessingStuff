import processing.video.*;

Capture cam;
int psize;

void setup() {
  size(640, 480);

    cam = new Capture(this);
    cam.start();  
    psize = (int)(640/4);   
}

void draw() {
  if (cam.available() == true) {
    cam.read();
    filter(BLUR);
  }
  for(int i=0;i<cam.width;i+=psize){
   for(int j=0;j<cam.height;j+=psize){
    color c = cam.get(i,j);
    noStroke();
    fill(c);
    ellipse(cam.width-i,j,psize,psize);
   } 
    
  }
}

