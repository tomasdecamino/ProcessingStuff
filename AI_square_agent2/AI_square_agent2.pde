float z=1.0;
float input=1.0;
int s=20;

void setup() {
  size(300, 300);
  background(0);
}

void draw() {  
  background(0);
  noStroke();
  fill(255,100);
  input=mouseX/40;
  ellipse(width/2, height/2, input*s, input*s);
  if (abs(sq(z)-input)>(10^(-15))) {
    z-=(sq(z)-input)/(10*z);
  }
  fill(255, 0, 0,100);
  ellipse(width/2, height/2, z*s, z*s);
}