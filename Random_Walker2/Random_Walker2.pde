
float x,y,xAnt,yAnt,xSun,ySun;
int r,g,b;
int count =0;
int d=10;

void setup(){
 size(700,700);
 x= width/2;
 y= height/2;
 xAnt = x;
 yAnt = y;
 xSun = 500;
 ySun = 500;
 r = 0;
 g = 0;
 b = 0;
 background(255);
 stroke(0);
 noFill();
 ellipseMode(CENTER);
 ellipse(xSun,ySun,100,100);
 
}

void draw(){
  //background(0);
  stroke(r,g,b,30);
  strokeWeight(3);
  xAnt = x;
  yAnt = y;
  if(sqrt((x-xSun)*(x-xSun)+(y-ySun)*(y-ySun))<50){
   d=1; 
  } else {
   d=20; 
  }
  x+=random(-d,d);
  y+=random(-d,d);
  line(xAnt,yAnt,x,y);
  strokeWeight(1);
  stroke(r,g,b,3);
  line(width/2,height/2,x,y);
  if((frameCount %1000) == 0){
   x= width/2;
   y= height/2;
   r = int(random(255));
   g = int(random(255));
   b = int(random(255));
   //saveFrame();
  }
}
