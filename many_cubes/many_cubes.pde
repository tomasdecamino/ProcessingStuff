//author Tomas de Camino Beck
//Public Domain

void setup() {
  size(displayWidth, displayHeight, P3D);
  smooth(8);
}

void draw() {
  background(0);

  spotLight(255, 255, 255, mouseX, mouseY, 400, 0, 0, -1, PI/4, 2);
  for (int j=0; j<=height+100;j+=200) {
    for (int i=0; i<=width+100;i+=200) {
      pushMatrix();
      scale(1);
      translate(i, j, -500);
      strokeWeight(1);
      stroke(255, 255);
      //noStroke();
      //noFill();
      rotateX(-2);
      rotateX(map(mouseY,0,width,-PI,PI));
      rotateY(map(mouseX,0,width,-PI,PI));
      box(200);
      popMatrix();
    }
  }
  //saveFrame();
}

