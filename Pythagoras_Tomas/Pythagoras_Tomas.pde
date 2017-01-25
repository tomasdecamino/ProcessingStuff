int l=8;
float rl = 0;
float rr = 0;
boolean[][] choice=new boolean[l][2]; 

void setup() {
  size(displayWidth, displayHeight);
  smooth(8);
  background(255);
  for (int i=0;i<l;i++) {
    choice[i][0]=random(1)>rl;
    choice[i][1]=random(1)>rr;
  }
}

void draw() {
  frameRate(10);
  background(255);
  fill(0);
  stroke(0, 100);
  int x=width/2;
  int y =height-150;
  //rect(0, 0, width, height);
  //noFill();
  // drawPythagoras(70,200,40,1);
  // drawPythagoras(270,200,40,2);
  // drawPythagoras(470,200,40,3);
  drawPythagoras(x, y, 150, l);
  if (keyPressed) {
    for (int i=0;i<l;i++) {
      choice[i][0]=random(1)>rl;
      choice[i][1]=random(1)>rr;
    }
    //saveFrame();
  }
}

void drawPythagoras(int x, int y, int h, int levels) {
  rect(x, y, h, h);
  catetos(x, y, h, levels);
}

void catetos(float x, float y, float h, int level) {
  if (level>0) {
    pushMatrix();
    translate(x, y);
    //calcuates sides abd angles
    float a = map(mouseX, 0, width, 0, h);
    float b=sqrt(sq(h)-sq(a));
    float ang = PI+atan2(b, a);
    float angA = TWO_PI+(ang);
    //rect(0,0,h,h);

    //draws right squares
    pushMatrix();
    translate(h, 0);
    rotate(ang);
    textSize(24);
    rect(0, 0, a, a);
    rotate(PI);
    if (choice[level-1][0]) {
      catetos(-a, -a, a, level-1);
    }
    popMatrix();

    //draws left square
    pushMatrix();
    rotate(angA);
    rect(0, 0, b, b);
    translate(b, 0);
    rotate(HALF_PI);
    if (choice[level-1][1]) {
      catetos(0, 0, b, level-1);
    }
    popMatrix();  

    popMatrix();
  }
}

