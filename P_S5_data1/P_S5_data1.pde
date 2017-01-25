String[] data;
PFont font;
float angle;

void setup() {
  size(800,800);
  font = loadFont("AmericanTypewriter-64.vlw");
  data = loadStrings("datos.txt");
  angle = data.length;
  textSize(10);
 // textAlign(CENTER);
 smooth();
}


void draw() {
  background(0);
  fill(255);
  stroke(255);
  rect(0, 0, 10, 10);
  textFont(font, 12);
  float offset= map(mouseX,0,width,0,PI);
  for(int i=0; i<data.length;i++){
    pushMatrix();
    translate(width/2,height/2);
    rotate(angle*i+offset);
    line(0,0,200,200);
    text(data[i], 200, 200);
    popMatrix();
  }
}