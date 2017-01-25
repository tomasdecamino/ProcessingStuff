import org.openkinect.*;
import org.openkinect.processing.*;

Kinect kinect;
PImage display;
int kw = 640;
int kh = 480;
int[] depth;
float xr,yr;
int r,g,b;



void setup() {
  size(displayWidth,displayHeight);
  xr = displayWidth/kw;
  yr =displayHeight/kh;
  println(displayHeight);
  println(yr);
  kinect = new Kinect(this);
  kinect.start();
  kinect.enableDepth(true);
  kinect.processDepthImage(true);
  display = createImage(kw,kh,PConstants.RGB);
  background(255);
  r=255;
  g=161;
  b=105;
}

void draw(){
  smooth(8);
  strokeWeight(2);
  fill(0,10);
  noStroke();
  rect(0,0,width,height);
  fill(r,g,b,50);
  rect(0,0,width,20);
  depth = kinect.getRawDepth();
    for(int x = 0; x < kw; x+=15) {
      for(int y = 0; y < kh; y+=15) {
        // mirroring image
        int offset = kw-x-1+y*kw;
        // Raw depth
        int rawDepth = depth[offset];
        if (rawDepth < 950) {
          //noFill();
          int s =(1000-rawDepth)/10;
          stroke(r,g,b,150);
          arrow(x*xr,y*1.6,s,random(0,360));
          //ellipse(x*xr,y*1.6,random(s),random(s));
          if(y*1.6<20){
            
              r=int(random(255));
              g=int(random(255));
              b=int(random(255));
           
          }
        } 
      }
    }
}

void arrow(float x, float y, int l, float ang){
  //para determinar el largo de la punta en 45 grados
  int arrowLength = 4;
  pushMatrix();
  //cambia el eje del dibujo y lo rota
  translate(x, y);
  rotate(radians(ang));
  //dibuja una linea y flecha en el eje X
  line(0,0,l, 0);
  line(l, 0, l - arrowLength, -arrowLength);
  line(l, 0, l - arrowLength, arrowLength);
  popMatrix();
}
