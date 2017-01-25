PImage img;
PVector p;
PVector p2;
float a = 0;
ArrayList<Gear> gears = new ArrayList<Gear>();


void setup() {
  img = loadImage("tomas4.JPG");
  size(img.width, img.height);
  image(img, 0, 0);
  loadPixels();
  p = new PVector(80, 80, 0);
  p2 = new PVector(155, 80, 0);
  ellipseMode(CENTER);
  smooth(8);
  gears.add(new Gear(width/2, height/2, 20, 0.05));
  float an=0;
  for (int i=0;i<pixels.length;i+=100) {
    Gear g = new Gear(gears.get(gears.size()-1),an, random(5,20));
    int loc = constrain(int(g.pos.x + g.pos.y * width),0,pixels.length-1);
    g.c= pixels[loc];
    gears.add(g);
    an+=0.1;
  }
}

void draw() {
  background(0);
  //background(#2D64D6);
  stroke(255, 200);
  strokeWeight(2);
  
  for (int i=0;i<gears.size();i++) {
    Gear part =gears.get(i); 
    fill(part.c, 30);
    part.display();
    part.update();
  }
  //saveFrame("frames/####.jpg");
}

