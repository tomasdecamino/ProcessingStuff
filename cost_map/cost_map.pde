PImage img;

ArrayList<PVector> place = new ArrayList<PVector>();

void setup() {
  size(displayWidth, displayHeight);
  // Images must be in the "data" directory to load correctly
  img = loadImage("world.jpg");
}

void draw() {
  image(img, 0, 0, width, height);
  if (mousePressed)place.add(new PVector(mouseX, mouseY, 0));
  //display points
  for (int i = 0; i < place.size(); i++) {
    PVector point = place.get(i);
    noStroke();
    fill(#EDFF00,150);
    ellipse(point.x,point.y,20,20);
    for (int j = i+1; j < place.size(); j++) {
      PVector point2 = place.get(j);
      stroke(#EDFF00,100);
      line(point.x,point.y,point2.x,point2.y);
    }
  }
}