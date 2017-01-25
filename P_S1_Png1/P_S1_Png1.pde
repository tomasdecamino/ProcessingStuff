PImage photo;

void setup() {
  size(600, 600);
  photo = loadImage("sun.png");
  imageMode(CENTER);
  background(255);
}

void draw() {
  background(255);
  translate(width/2,height/2);
  rotate(map(mouseX,0,width,0,TWO_PI));
  image(photo, 0, 0);
  filter(BLUR,10);
  image(photo, 0, 0);
  
}