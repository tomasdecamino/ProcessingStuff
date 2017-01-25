PImage [] img = new PImage[6];

void setup() {
  // Images must be in the "data" directory to load correctly
  img[0] = loadImage("1.jpg");
  img[1] = loadImage("2.jpg");
  img[2] = loadImage("3.jpg"); 
  img[3] = loadImage("4.jpg");
  img[4] = loadImage("5.jpg");
  img[5] = loadImage("6.jpg");  
  size(displayWidth,displayHeight);
  background(0,0,0);
  imageMode(CENTER);
}

void draw() {
  background(255,255,242);
  int imgseq = int(map(mouseX,0,width,0,5));
  image(img[imgseq], width/2, height/2);
}
