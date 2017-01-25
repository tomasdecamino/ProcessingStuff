//import processing.pdf.*;

int n =1000;
int s =1;
int r =20;
float th =0.09;
float [][] node = new float[n][3];

void setup() {
  float ang =0;
 // size(displayWidth, displayHeight,PDF, "goldenRatio.pdf");
  size(displayWidth, displayHeight);
  r=displayHeight/200;
  for (int i =0;i<n;i++) {
    //node[i][0]=random(50, width-50);
    //node[i][1]=random(50, height-50);
    //node[i][0]=(r*i)*sin(ang);
    //node[i][1]=(r*i)*cos(ang);
    node[i][0]=r*(sqrt(i))*sin(TWO_PI *i * 1.61803);
    node[i][1]=r*(sqrt(i))*cos(TWO_PI *i * 1.61803);
    node[i][2]=1;
    ang+=TWO_PI/25;
  }
  smooth(8);
  ellipseMode(CENTER);
}

void draw() {
  //frameRate(1);
  background(255);
  //rect(0,0,width,height);
  //noFill();
  fill(0, 200);
  for (int i =0;i<n;i++) {
    if (node[i][2]>th) { 
      pushMatrix();
      stroke(0,200);
      scale(8);
      translate(0,0);
      //rotate(HALF_PI);
      fill(0,50);
      noFill();
      //strokeWeight(2);
     // point(node[i][0], node[i][1]);
      strokeWeight(0.1);
      //ellipse(node[i][0], node[i][1], 100, 100);
      for (int j=i;(j<n&&j<i+2);j++) {
        if (node[j][2]>th) {
          noFill();
          //fill(0,50);
          //noFill();
          strokeWeight(0.05);
          line(node[i][0], node[i][1],node[j][0], node[j][1]);
          //bezier(node[i][0], node[i][1],node[i][0]+random(-s,s), node[i][1]+random(-s,s), node[j][0]+random(-s,s), node[j][1]+random(-s,s),node[j][0], node[j][1]);
        }
      }
     // node[i][2]=random(1);
      popMatrix();
    }
  }
  if(keyPressed)saveFrame("frames/####.jpg");
  //exit();
}

