float x,y;

void setup(){
 size(400,400);//cambiar tamano de pantalla 
 background(255,200,255);
 x=width/2;
 y=height/2;
 smooth();
}

void draw(){
  background(map(mouseX,0,width,0,255),map(mouseY,0,height,0,255),255);
  //stroke(0,100,255,100);
  noStroke();
  fill(255,0,0,100);
  x = x+(x-mouseX)/100;
  y = y+(y-mouseY)/100;
  ellipse(x,y,50,50);
  if(x>width)x=width-5;
  if(x<0) x=5;
  if(y>height)y=height-5;
  if(y<0) y=5;
  
}
