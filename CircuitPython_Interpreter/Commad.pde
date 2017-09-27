/* @author: Tomas de Camino Beck
 @version: 1.0 Sep 2017
 www.funcostarica.org
 */

class Command {
  PImage img;//img for display pouposes
  int s =100; //size
  String[] code;//code to be added
  PVector pos = new PVector(-100, -100, 0);//display position
  PVector posAnt=new PVector(0, 0, 0);//display position of previous

  //first argument is an image, second is the code
  //that will be written
  Command(PImage i, String c) {
    code= split(c, ":");
    img = i;
  }
  //display icon image
  void display(int x, int y) {
    pushMatrix();
    translate(x, y);
    image(img, 0, 0);
    popMatrix();
  }

  void display() {
    //draws a curve if no the first
    if (pos.x!=posAnt.x)curve(pos.x+200, pos.y-200, pos.x, pos.y, posAnt.x, posAnt.y, posAnt.x-200, posAnt.y-200);
    pushMatrix();
    translate(pos.x, pos.y);
    image(img, 0, 0);
    popMatrix();
  }
  
  void arrow(float x1, float y1, float x2, float y2){
    pushMatrix();
    
    
    popMatrix();
    
    
  }
}