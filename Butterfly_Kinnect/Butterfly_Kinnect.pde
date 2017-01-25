/* User Position Tracking in Processing with SimpleOpenNI Wrapper by Max Rheiner */
import SimpleOpenNI.*;
SimpleOpenNI kinnect;

float xr, yr;
int nFlies = 2;
int[][] bp=new int[nFlies][2];

void setup()
{
  size(displayWidth, displayHeight); 
  xr = width/640;
  yr= height/480;

  for (int i=0;i<nFlies;i++) {
    bp[i][0]=(int)random(width);
    bp[i][1]=(int)random(height);
  }

  kinnect = new SimpleOpenNI(this);

  /***** espejo ******/
  kinnect.setMirror(true);

  kinnect.enableDepth();
  kinnect.enableUser(); 
  kinnect.userImage();
}

void draw()
{
  frameRate(10);
  kinnect.update();
  background(0, 0, 0);
  //image(kinnect.depthImage(),0,0); 
  int userCount = kinnect.getNumberOfUsers();
  PVector posRealWorld = new PVector();
  PVector posProjected = new PVector();
  if (userCount>0) {
    for (int userId = 1; userId <= userCount; userId++)
    {

      // centro d masa
      kinnect.getCoM(userId, posRealWorld);

      // conversi'on a coordenadas de pixles 
      kinnect.convertRealWorldToProjective(posRealWorld, posProjected);

      fill(100, 255, 100);
      point(posRealWorld.x, posRealWorld.y, posRealWorld.z);

      float dx = posProjected.x*xr;
      float dy = posProjected.y*yr;

      //println(posProjected);
      //ellipse(dx, dy, 40, 40);

      for (int i=0;i<nFlies;i++) {
        float diffX = bp[i][0]+(dx-bp[i][0])/(i*20);
        float diffY = bp[i][1]+(dy-bp[i][1])/(i*20);
        bp[i][0] = (int)diffX;
        bp[i][1] = (int)diffY;
        println(diffX);
        butterfly(bp[i][0], bp[i][1], 10, 8);
        //  butterfly(bp[i][0],bp[i][1], 10, 2);
        //ellipse(dx, dy, 40, 40);
      }
    }
  }
  else {
    for (int i=0;i<nFlies;i++) {
      bp[i][0]=(int)random(width);
      bp[i][1]=(int)random(height);
      butterfly(bp[i][0], bp[i][1], 10, 8);
    }
  }
}

void butterfly(float x, float y, int l, float s) {
  float ang = random(HALF_PI);
  loopPoint(x, y, l, ang+random(-0.1, 0.1), s);
  loopPoint(x, y, l, ang+3.14+random(-0.1, 0.1), s);
}

void loopPoint(float x, float y, int l, float ang, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(ang);
  beginShape();
  curveVertex(0, 0); 
  curveVertex(0, 0);
  curveVertex(l, l);
  curveVertex(l, -l);    
  curveVertex(0, 0);
  curveVertex(0, 0);   
  endShape();
  popMatrix();
}

