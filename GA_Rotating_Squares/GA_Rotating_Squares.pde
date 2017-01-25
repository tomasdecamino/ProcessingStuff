import controlP5.*;
ControlP5 cp5;
float ang=0;
float angInc=0.01;
int s=300;
int c=30;
int l=0;

void setup() {
  size(600, 600);
  rectMode(CENTER);
  background(255);
  smooth(8);

  cp5 = new ControlP5(this);

  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'sliderValue' 
  cp5.addSlider("angInc")
    .setPosition(10, 10)
      .setRange(0, HALF_PI)
        ;

  cp5.addSlider("s")
    .setPosition(10, 30)
      .setRange(10, 400)
        ;

  cp5.addSlider("c")
    .setPosition(10, 50)
      .setRange(0, 100)
        ;

  cp5.addSlider("l")
    .setPosition(10, 70)
      .setRange(0, 1)
        ;
}

void draw() {
  fill(255, 10);
  stroke(0, 100);
  pushMatrix();
  translate(width/2+sin(ang)*50, height/2+cos(ang)*50);
  rotate(ang);
  rect(c, c+l, s, s, 20);
  ang+=angInc;
  popMatrix();
  if (keyPressed) {
    saveFrame("frames/####.jpg");
  }
  saveFrame("frames/####.jpg");
}