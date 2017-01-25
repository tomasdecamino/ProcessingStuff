/* @author: Tomas de Camino Beck
   @version: 1.0 Nov 2016
   www.funcostarica.org
*/

PImage mouseImg;
PVector point;
int pSize = 10;
int counter = 0;
int pX, pY;
int time=0;
boolean normal=true;

void setup() {
  size(800, 800);
  //image for crosshair
  mouseImg = loadImage("cursor.png");
  //random point
  point = new PVector(random(width), random(height), 0);
  imageMode(CENTER);
  noCursor();
  time=millis()/1000;
}

void draw() {

  //reset counts every n seconds
  if (millis()/1000-time<=10) {
    //color stuff
    background(100);
    fill(0);
    text(counter, 20, 20);
    text(millis()/1000, 20, 40);
    strokeWeight(80);
    stroke(200, 200, 0, 200);
    point(point.x, point.y);
    strokeWeight(pSize);
    stroke(255, 0, 0, 200);
    point(point.x, point.y);

    //press any key to invert movement
    if (keyPressed) {
      normal =!normal;
    }
    if (normal) {
      pX=mouseX;
      pY=mouseY;
    } else {
      pX=width-mouseX;
      pY=height-mouseY;
    }
    //show crosshair
    tint(255, 150);
    image(mouseImg, pX, pY);
  } else {
    println(counter);
    counter=0;
    time=millis()/1000;
  }
}


//when mouse click calculates distance and counts
//if it is within radius
void mouseClicked() {
  
  if (dist(pX, pY, point.x, point.y) <= pSize) {
    counter++;
  }
  point.set(random(width), random(height), 0);
}