float x,y;
int r,g,b;
int count =0;

void setup(){
 size(400,400);
 x= width/2;
 y= height/2;
 r = 255;
 g = 255;
 b = 255;
 background(0); 
}

void draw(){
  //background(0);
  stroke(r,g,b,5);
  strokeWeight(8);
  point(x,y);
  x+=random(-2,2);
  y+=random(-2,2);
  if((frameCount %6000) == 0){
   x= width/2;
   y= height/2;
   r = int(random(255));
   g = int(random(255));
   b = int(random(255));
   saveFrame();
  }
}
