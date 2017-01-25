PImage img;
int s = 8;

void setup() {
  background(255);
  img = loadImage("logo.png");
  loadPixels();
  background(255);
  size(600, 600);
}

void draw() {

  frameRate(30);
  loadPixels();
  noStroke();
  smooth(4); 
  image(img, 0, 0); 
  loadPixels();
  background(255);
  for (int i = 0; i < width; i= i+s) {
    for (int j = 0; j < height; j= j+s) {
      int loc = i + (j * width) ;

      if (pixels[loc]!=-1) {
        //fill(pixels[loc], 100);
        fill(255, 0, 10, 100);
        //noFill();
        stroke(0);
        strokeWeight(1);
        //noStroke();
        float r =  random(0, 10);
        float dX=random(-5, 5);
        float dY=random(-5, 5);
        ellipse(i+dX, j+dY, s+r, s+r);
      }
    }
  }  

  saveFrame("frames/####.tif");
}