int n =70;
int s =1;
int r =300;
float th =0.09;
float [][] node = new float[n][3];

void setup() {
  float ang =0;
  size(displayWidth, displayHeight);
  r=displayHeight/200;
  for (int i =0;i<n;i++) {
    //node[i][0]=random(50, width-50);
    //node[i][1]=random(50, height-50);
    node[i][0]=(r*i)*sin(ang);
    node[i][1]=(r*i)*cos(ang);
    node[i][2]=1;
    ang+=TWO_PI/25;
  }
  smooth(8);
}

void draw() {
  frameRate(1);
  fill(255,200);
  noStroke();
  rect(0,0,width,height);
  //noFill();
  fill(0, 200);
  stroke(10, 10);
  for (int i =0;i<n;i++) {
    if (node[i][2]>th) { 
      pushMatrix();
      translate(800,height/2);
      rotate(HALF_PI);
      fill(0,150);
      ellipse(node[i][0], node[i][1], frameCount+10, frameCount+10);
      for (int j=i;j<n;j++) {
        if (node[j][2]>th) {
          fill(0,50);
          //noFill();
          strokeWeight(1);
          bezier(node[i][0], node[i][1],node[i][0]+random(-s,s), node[i][1]+random(-s,s), node[j][0]+random(-s,s), node[j][1]+random(-s,s),node[j][0], node[j][1]);
        }
      }
     // node[i][2]=random(1);
      popMatrix();
    }
  }
  //saveFrame("frames/####.tif");
}

