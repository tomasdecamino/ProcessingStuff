PImage img;  

void setup() {
  size(displayWidth,displayHeight);
  // Make a new instance of a PImage by loading an image file
  img = loadImage("IMG_9095.JPG");
  image(img,0,0, width,height);
  loadPixels();
}

void draw() {
  background(0);
  // Draw the image to the screen at coordinate (0,0)
  //image(img,0,0, width,height);

  for(int x=0;x<width;x+=20){
   for(int y=0;y<height;y+=20){
    color c=pixels[x+y*width];
    fill(c);
    ellipse(x,y,20,20);
   } 
    
  }
}
