//@author: Tomas de Camino Beck
//www.funcostarica.org

float a=0; //current angle
float posX=0; //position of the circle

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
  a+=1; //inclrease angle
  //saveFrame("frames/f/####.jpg");

}

void drawHarmonicCircles(int n, int amp, int x, int y, float a) {
  //draw cricles recursively
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, amp/2, 0);
  ellipse(0, 0, amp, amp);
 // point(0,0);
  if (n>0)drawHarmonicCircles(n-1, amp/3, amp/2, 0, a);
  popMatrix();
}