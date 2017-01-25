void setup() {
  size(displayWidth, displayHeight); 
  textSize(100);
  background(255);
}

void draw() {
  fill(255, 10);
 // rect(-10, -10, width+10, height+10);
}

void mouseMoved() {
  fill(#5F70D6);
  ellipse(mouseX, mouseY, 100, 100);
}

void keyPressed() {  
    fill(0);
    //ellipse(width/2, height/2,10,10);
    text(key, mouseX, mouseY);
}
