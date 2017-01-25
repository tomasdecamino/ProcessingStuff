import controlP5.*;

ControlP5 cp5;

int TextSize = 100;

String[] data;
PFont font;


void setup() {
  cp5 = new ControlP5(this);
  cp5.addSlider("TextSize")
    .setPosition(10, 10)
    .setRange(6, 32)
    .setValue(12)
    ;

  size(800, 800);
  font = loadFont("AmericanTypewriter-64.vlw");
  data = loadStrings("datos.txt");
  // textAlign(CENTER);
  smooth();
}


void draw() {
  background(0);
  fill(255);
  stroke(255);
  textFont(font, TextSize);
  float offset= map(mouseX, 0, width, 0, PI);
  for (int i=0; i<data.length; i++) {
    pushMatrix();
    translate(0, height);
    rotate(-HALF_PI);
    text(data[i], 0, i*TextSize);
    popMatrix();
  }
}