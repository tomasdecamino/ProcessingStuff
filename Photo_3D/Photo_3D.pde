PImage img;
color[] imgArray;
int pos=height/2;
float alt=0.1;
int s=10;

void setup() {
  // Images must be in the "data" directory to load correctly
  img = loadImage("https://upload.wikimedia.org/wikipedia/commons/f/f0/Full_Moon_as_Seen_From_Denmark.jpg");
  size(1000, 1000, P3D);
  image(img, 0, 0);
  loadPixels();
  imgArray = new color[pixels.length];
  for(int i=0;i< pixels.length;i++){
    imgArray[i] = pixels[i]; 
  }
  smooth();
  //noCursor();
}

void draw() {
  frameRate(10);
  // s-=1;
  background(0);
  float fov = PI/3;
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), cameraZ/10.0, cameraZ*10.0);
  camera(mouseX, pos, (mouseY) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  for (int x = 0; x < width; x+=s) {
    // Loop through every pixel row
    for (int y = 0; y < height; y+=s) {
      // Use the formula to find the 1D location
      int loc = x + y * width;
      color c = imgArray[loc];
      pushMatrix();
      translate(x, y, (255-(int)hue(c)/2)*alt);
      noFill();
      //fill(c, 100);
      stroke(c, 250);
      strokeWeight(s);
      //noStroke();
      //point(0,0,0);
      stroke(c, 255);
      point(0,0,-(255-(int)hue(c)/2)*alt);
      //sphere(s/2);
      strokeWeight(1);
      box(s, s, (255-(int)hue(c)/2)*alt);
      popMatrix();
    }
  }
  //saveFrame("frames/####.jpg");
}

void keyPressed() {  
  if (keyCode ==DOWN ) {
    pos+=10;
  } 
  if (keyCode ==UP ) {
    pos-=10;
  }
  if (keyCode == LEFT) {
    alt-=0.1;
  }
  if (keyCode == RIGHT) {
    alt+=0.1;
  }
  if (keyCode == ALT) {
    saveFrame("frames/####.jpg");

  }
}