void setup() {
  size(displayWidth, displayHeight);
}

void draw() {
  for (int x = 0; x<width;x++){
    for (int y = 0; y<width;y++){
      ellipse(x,y,sin(y/8)*cos(y/8),cos(y/8));
    }
  }
}

