// @author: Tomas de Camino Beck

PFont font;

int n =10; //number of points
int len=270; //radius
int m = 1;  //multiplier

//Dynamic array of points
ArrayList<PVector> pt = new ArrayList<PVector>();

void setup() {
  font = loadFont("Courier10PitchBT-Roman-48.vlw");
  textFont(font, 14);
  size(1000, 1000);
  //create evenly distributed points on the circumference
  for (int i=0; i<n; i++) {
    pt.add(new PVector(cos(TWO_PI/n*i)*len, sin(TWO_PI/n*i)*len, 0));
  }
  smooth(8);
}

void draw() {
  frameRate(2);
  background(255);
  stroke(0);
  fill(0, 100);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < pt.size(); i++) {
    //get point
    PVector p = pt.get(i);
    strokeWeight(10);
    //draw point
    point(p.x, p.y);
    for (int j=0; j<10; j++) {
      float x=cos(TWO_PI/n*i)*(len+30+j*20); 
      float y=sin(TWO_PI/n*i)*(len+30+j*20);
      text(i+(j*10), x, y);
    }
  }
  popMatrix();
  //uncomment for saving pictures
  //saveFrame("frames/####.jpg");
}