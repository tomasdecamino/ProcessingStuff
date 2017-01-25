
float dx=500;
float dy=400;
int nb=40;
float bp[][]=new float[nb][2];

void setup() {

  size(displayWidth, displayHeight);
  textSize(24);
  for (int i=0;i<nb;i++) {
    bp[i][0]=random(100, width-100);
    bp[i][1]=random(100, height-100);
  }
  // xb = width/2;
  // yb = height/2;
}

void draw() {

  background(0);
  noFill();
  //ellipse(mouseX,mouseY,200,200);
  // draw blob results
  strokeWeight(1);
  stroke(255);
  fill(200, 0, 0);
  for (int i=0;i<nb;i++) {
    if (keyPressed) {
      bp[i][0]=bp[i][0]+(dx-bp[i][0])/((i*4+1)*2)+random(-4, 4);
      bp[i][1] = bp[i][1]+(dy-bp[i][1])/((i*4+1)*2)+random(-4, 4);
    }
    else {
      if (bp[i][0]>0 & bp[i][0]<width & bp[i][1]>0&bp[i][1]<height) {
        bp[i][0]=bp[i][0]+random(-20, 20);
        bp[i][1] = bp[i][1]+random(-20, 20);
      }else{
        bp[i][0]=width/2;
        bp[i][1]=height/2;
      }
      
    }
    butterfly(bp[i][0], bp[i][1], 10, 4);
  }
}

void butterfly(float x, float y, int l, float s) {
  float ang = random(PI);
  loopPoint(x, y, l, ang+random(-0.3, 0.3), s);
  loopPoint(x, y, l, ang+3.14+random(-0.3, 0.3), s);
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

