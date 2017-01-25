//Generative Design Prueba 1
//Tomas de Camino Beck

float controlPoint[][]=new float[6][2];

void setup() {
  size(displayWidth, displayHeight);
  smooth(8); 
  background(255);
  for (int i=0;i<6;i++) {
    controlPoint[i][0]=random(-80, 80);
    controlPoint[i][1]=random(-80, 80);
  }
}

void draw() {
  noFill();
  strokeWeight(1);
  stroke(0, 50);
  bezier(mouseX, mouseY, 1);
  for (int i=0;i<6;i++) {
    controlPoint[i][0]=controlPoint[i][0]+random(-2, 2);
    controlPoint[i][1]=controlPoint[i][1]+random(-2, 2);
  }
}

void bezier(int x, int y, float s) {

  pushMatrix();
  translate(x, y);
  scale(s);
  beginShape();
  translate(x, y);
  vertex(0, 0);
  bezierVertex(controlPoint[0][0], controlPoint[0][1], controlPoint[1][0], controlPoint[1][1], controlPoint[2][0], controlPoint[2][1]);
  bezierVertex(controlPoint[3][0], controlPoint[3][1], controlPoint[4][0], controlPoint[4][1], controlPoint[5][0], controlPoint[5][1]);
  bezierVertex(-controlPoint[2][0], -controlPoint[2][1], controlPoint[1][0], controlPoint[1][1], controlPoint[0][0], controlPoint[0][1]);
  endShape();
  popMatrix();
}

void keyPressed() {
  background(255);
  for (int i=0;i<6;i++) {
    controlPoint[i][0]=random(-80, 80);
    controlPoint[i][1]=random(-80, 80);
  }
}

