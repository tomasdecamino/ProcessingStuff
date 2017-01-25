void setup() {
  size(displayWidth, displayHeight);
  background(0);
  ellipseMode(CENTER);
}

void draw() {
  smooth(8);
  stroke(0, 0);
  if (keyPressed == true) {  
    fill(159, 99, 260,100);
    ellipse(width/2, height/2, width, height-149);
    if (keyCode == UP) {
      fill(227, 225, 26,100);
      ellipse(width/2, height/2, width-194, height-200);
    }
    if (keyCode == DOWN) {
      fill(11, 46, 197,100);
      ellipse(width/2, height/2, width-499, height-265);
    }
    if (keyCode == LEFT) {
      fill(227, 0, 0,100);
      ellipse(width/2, height/2, width-682, height-300);
    }
    if (keyCode == RIGHT) {
      fill(47, 245, 37,100);
      ellipse(width/2, height/2, width-1000, height-500);
    }
  }
 // rect(0,0,width,he)
}

