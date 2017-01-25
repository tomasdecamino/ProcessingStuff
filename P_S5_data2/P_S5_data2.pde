import controlP5.*;

ControlP5 cp5;

int TextSize = 100;
int Color=0;

String[] data;
PFont font;
float angle;

void setup() {
  cp5 = new ControlP5(this);
  cp5.addSlider("TextSize")
    .setPosition(10, 10)
    .setRange(6, 32)
    .setValue(12)
    ;

  cp5.addSlider("Color")
    .setPosition(10, 40)
    .setRange(0, 255)
    .setValue(100)
    ;

  size(800, 800);
  font = loadFont("Purisa-48.vlw");
  data = loadStrings("datos.txt");
  angle = data.length;
  // textAlign(CENTER);
  smooth();
}


void draw() {
  background(0);
  fill(Color);
  stroke(255);
  textFont(font, TextSize);
  float offset= map(mouseX, 0, width, 0, PI);
  for (int i=0; i<data.length; i++) {
    pushMatrix();
    translate(width/2, height/2);
    rotate(angle*i+offset);
    line(0, 0, 200, 200);
    text(data[i], 200, 200);
    popMatrix();
  }
}