int x, y;
void setup() {
  float w=(displayWidth*4)/3;
  print(w);
  print(displayHeight);
  size(960, 720);  
  background(0);
}

void draw() { 
  fill(255);
  stroke(255);
  if (mousePressed) {
    if (mouseButton ==RIGHT) {
      line(x, y, mouseX, mouseY) ;
    }
    text(mouseX, mouseX-30, mouseY-30);
    text(mouseY, mouseX+30, mouseY-30);
    drawCross(mouseX, mouseY, 30);
    x = mouseX;
    y = mouseY;
  }
}

void drawCross(int x, int y, int s) {
  pushMatrix();
  line(x-s, y, x+s, y);
  line(x, y-s, x, y+s);
  noFill();
  ellipse(x, y, s/2, s/2);
  translate(x, y);
  popMatrix();
}

void keyPressed() {
  saveFrame();
}

