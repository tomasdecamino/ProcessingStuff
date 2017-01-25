float a=0;
int maxPoints =1000;
ArrayList<PVector> points = new ArrayList<PVector>();
float posX=0;

void setup() {
  size(600, 600);
  background(0);
  smooth(8);
  posX=width/2;
}


void draw() {
  //background(255);
 // frameRate(25);
  fill(255,2);
 // rect(-10,-10,width+10,height+10);
  fill(255, 0);
  noFill();
  stroke(255, 20);
  strokeWeight(2);
  drawHarmonicCircles(5, 400, (int)posX,height/2, a);
  drawHarmonicCircles(5, 200, (int)posX,height/2, a);
  drawHarmonicCircles(3, 800, (int)posX,height/2, a);
  //posX+=0.5;
  a+=1;
  saveFrame("frames/f/####.jpg");
  //if (a<=TWO_PI) {
  //  saveFrame("frames/####.jpg");
  //}
}

void drawHarmonicCircles(int n, int amp, int x, int y, float a) {

  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, amp/2, 0);
  ellipse(0, 0, amp, amp);
 // point(0,0);
  if (n>0)drawHarmonicCircles(n-1, amp/3, amp/2, 0, a);
  popMatrix();
}

void drawTrace(float x, float y) {
  if (points.size()>maxPoints)points.remove(0);
  points.add(new PVector(x, y, 0));
  for (int i = 0; i<points.size();i++) {
    PVector part = points.get(i); 
    point(part.x, part.y);
  }
}