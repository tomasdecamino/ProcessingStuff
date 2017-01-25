void setup() {
  size(640, 480);
  background(0);
}

void draw() {
  noStroke();
  //ellipse(mouseX, mouseY, 80, 80);
  brushEllipse(mouseX, mouseY, 100);
}

void brushEllipse(float x1, float y1, float r){
  for(int j = 1; j<5; j++){
    fill(255,j^2);
    ellipse(mouseX-j, mouseY-j, r+j, r+j);
  }
}
