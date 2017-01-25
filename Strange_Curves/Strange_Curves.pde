// @author: Tomas de Camino Beck

int n =400; //number of points
int len=300; //radius
int m = 1;  //multiplier

//Dynamic array of points
ArrayList<PVector> pt = new ArrayList<PVector>();

void setup() {
  size(640, 640);
  //create evenly distributed points on the circumference
  for (int i=0; i<n; i++) {
    pt.add(new PVector(cos(TWO_PI/n*i)*len, sin(TWO_PI/n*i)*len, 0));
  }
  smooth(8);
}

void draw() {
  frameRate(2);
  background(255);
  stroke(0,100);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < pt.size(); i++) {
    //get point
    PVector p = pt.get(i);
    strokeWeight(2);
    //draw point
    point(p.x, p.y);
    
    //get second point in postion multiplied by m
    //function modulo % to go around
    PVector p2 = pt.get((i*m)%n);
    strokeWeight(1);
    //draw line
    line(p.x, p.y, p2.x, p2.y);
  }
  popMatrix();
  m++;
  //uncomment for saving pictures
  //saveFrame("frames/####.jpg");
}