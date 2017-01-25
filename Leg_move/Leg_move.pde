PImage img1,img2;
PCoupledLines cl,cl2;
float r=55;


void setup() {

  //rod1.moveTo(width/2-10, height/2);
 size(800, 800);
  cl = new PCoupledLines(width/2,100,250,200,false);
  cl2 = new PCoupledLines(width/2,100,250,200,false);
  img1= loadImage("legB.png");
  img2= loadImage("legA.png");
  ellipseMode(CENTER);
  background(255);
  cl.setImages(img1,img2);
  cl2.setImages(img1,img2);
}


void draw() {
 
  background(255);
 
  stroke(0, 100);
  strokeWeight(10);
  fill(0, 100);

  stroke(0, 100);
  strokeWeight(10);
  float x1=width/2+50+ cos(-map(mouseX,0,width,0,2*TWO_PI))*r;
  float y1=height/2+80+ sin(-map(mouseX,0,width,0,2*TWO_PI))*r;
  float x2=width/2+50+ cos(-map(mouseX,0,width,0,2*TWO_PI)-4)*r;
  float y2=height/2+80+ sin(-map(mouseX,0,width,0,2*TWO_PI)-4)*r;

  cl.drawImages();
  cl2.drawImages();
    cl.update(x1, y1);
  cl2.update(x2, y2);

  //saveFrame("frames/####.jpg");
}



