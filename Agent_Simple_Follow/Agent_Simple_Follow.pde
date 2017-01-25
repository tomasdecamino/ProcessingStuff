//Created by Tomas de Camino
// Follow the mouse
 
float x,y;
 
void setup(){
 size(600,600);
 smooth();
 x= width/2;
 y= width/2;
 ellipseMode(CENTER);
}
 
void draw(){
  background(255);
  fill(10);
  noStroke();
  fill(100,114,200,100);
  ellipse(x ,y ,100,100);
  x+=(mouseX-x)/50;
  y+=(mouseY-y)/50;
}