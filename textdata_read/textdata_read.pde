String[] stuff;

void setup() {
  size(displayWidth,displayHeight);
  // Load text file as a string
  stuff = loadStrings("TEDx_Final.txt");
  // Convert string into an array of integers using ',' as a delimiter
  background(255);
}

void draw() {
  frameRate(12);
  //background(255);
  stroke(0);
    fill(random(255),random(255),random(255));
    text(stuff[frameCount%stuff.length],random(width),random(height));
}
