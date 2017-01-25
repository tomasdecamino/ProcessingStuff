PVector p;
PVector p2;
float a = 0;
ArrayList<Gear> gears = new ArrayList<Gear>();


void setup() {
  size(displayWidth, displayHeight);
  p = new PVector(80, 80, 0);
  p2 = new PVector(155, 80, 0);
  ellipseMode(CENTER);
  smooth(8);
  gears.add(new Gear(200, height/2, 200, 0.05));
  float an=0;
  for (int i=0;i<8;i++) {
    gears.add(new Gear(gears.get(i), random(3), random(10, 400)));
    an+=0.05;
  }
}

void draw() {
  background(#2D64D6);
  stroke(255, 200);
  strokeWeight(2);
  fill(255, 70);
  for (int i=0;i<gears.size();i++) {
    Gear part =gears.get(i); 
    part.display();
    part.update();
  }
  //saveFrame("frames/####.jpg");
}

