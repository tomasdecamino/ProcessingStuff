PFont font;
int mX=150;
int mY=150;
int roundC=30;
int buttonState=-1;

void setup() {
  size(displayWidth, displayHeight);
  rectMode(CORNER);
  smooth();
  font = loadFont("Computerfont-48.vlw");
  textFont(font, 48);
  textAlign(CENTER);
  displayButtons();
  loadPixels();
}

void draw() {
  background(0);
  fill(255);
  text(buttonState, width/2, 100);
  displayButtons();
  
  //delay(500);
}

void displayButtons() {
  drawButton(0, false);
  drawButton(1, false);
  drawButton(2, false);
  drawButton(3, false);
 // drawButton((int)random(4), true);
}

void drawButton(int quad, boolean h) {
  noStroke();
  int o = 150;
  if (h) o = 255;
  switch(quad) {
  case 0: 
    fill(color(255, 255, 0), o);
    rect(mX, mY, width/2-mX, height/2-mY,roundC);
    break;
  case 1: 
    fill(color(255, 0, 0), o);
    rect(width/2, mY, width/2-mX, height/2-mY,roundC);
    break;
  case 2: 
    fill(color(0, 255, 0), o);
    rect(mX, height/2, width/2-mX, height/2-mY,roundC);
    break;
  case 3: 
    fill(color(0, 0, 255), o);
    rect(width/2, height/2, width/2-mX, height/2-mY,roundC);
    break;
  }
}

void delay(int m) {
  long sMillis= millis();
  while (millis ()-sMillis<m);
}

void mouseClicked() {
  int c = pixels[mouseY*width+mouseX];
  if (c==-1381804) {
    buttonState = 0;
  }
  else if (red(c)>230 ) {
    buttonState = 1;
  }
  else if (green(c)>230 ) {
    buttonState = 2;
  }
  else if (blue(c)>230 ) {
    buttonState = 3;
  } else {
    buttonState = -1;
  }
  println(c);
}


