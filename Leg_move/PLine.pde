/**
 
 * Centro de Investigación para la Innovación
 * Universidad Veritas
 * 
 * @author  Tomás de Camino Beck
 * @version 1.0, 09/07/2015
 * @version 1.1, 24/07/2015
 */

class PLine {
  PVector p1, p2, pm;//points of the line
  PLine parent; //parent line (driver)
  PLine child; //child
  float slope, intercept, angle; //fitted line
  float distFromBase, hyp;
  int sign=1;//1 if left, -1 if right

  //constructor creates line from 2 points
  PLine(float x1, float y1, float x2, float y2, float h) {
    p1 = new PVector(x1, y1);
    p2 = new PVector(x2, y2);
    fit();
    distFromBase=h;
    hyp=dist(p1.x, p1.y, p2.x, p2.y);
    pm = new PVector(p1.x+cos(angle)*distFromBase, p1.y+sin(angle)*distFromBase, 0);
  }

  //creates a line form 1 point and angle
  PLine(float x1, float y1, float leng, float ang) {
    p1 = new PVector(x1, y1);
    p2 = new PVector(x1+cos(ang)*leng, y1+sin(ang)*leng, 0);
    fit();
    //distFromBase=h;
    hyp=leng;
    pm = new PVector(p1.x+cos(0)*distFromBase, p1.y+sin(0)*distFromBase, 0);
  }  
  
  //creates a line form 1 point and length
  PLine(float x1, float y1, int leng, int h) {
    p1 = new PVector(x1, y1);
    p2 = new PVector(x1+cos(0)*leng, y1+sin(0)*leng, 0);
    fit();
    distFromBase=h;
    hyp=leng;
    pm = new PVector(p1.x+cos(0)*distFromBase, p1.y+sin(0)*distFromBase, 0);
  }    

  void setParent(PLine l) {
    parent=l;
    p2=parent.pm;
    parent.child=this;
    if(parent.p1.x>p1.x){
      sign=1; 
    }else{
      sign=-1;
    }
  }

  void fit() {
    slope=(p2.y-p1.y)/(p2.x-p1.x);
    intercept=p1.y-slope*p1.x;
    angle = atan2(p2.y-p1.y, p2.x-p1.x);
  }
  
  //move p2 so it points to x,y, if there is no parent
  void pointTo(float x, float y) {
    if (parent==null) {
      //gets the angle to the point
      float ang=angleTo(x, y);
      //then recalculates p2 to point in that direction
      p2.set(p1.x+cos(ang)*hyp, p1.y+sin(ang)*hyp, 0);
      pm.set(p1.x+cos(ang)*distFromBase, p1.y+sin(ang)*distFromBase, 0);
      fit();
    }
  }

  //moves p1 and pm to new location contrained by hypothenuse and p2
  void moveTo(float x, float y) {
    float ang=atan2(y-p2.y, x-p2.x);
    p1.set(p2.x+cos(ang)*hyp, p2.y+sin(ang)*hyp, 0);
    pm.set(p1.x+cos(ang)*distFromBase, p1.y+sin(ang)*distFromBase, 0);
    angle=ang;
  }

  //moves the entire line (set p1 to x,y and recalculates p2 and pm)
  void moveLine(float x, float y) {
    float ang=atan2(y-p2.y, x-p2.x);
    p1.set(x, y);
    p2.set(p1.x+cos(ang)*hyp, p1.y+sin(ang)*hyp, 0);
    pm.set(p1.x+cos(ang)*distFromBase, p1.y+sin(ang)*distFromBase, 0);
  }  

  void moveAngle(float ang) {
    p2.set(p1.x+cos(ang)*hyp, p1.y+sin(ang)*hyp, 0);
    pm.set(p1.x+cos(ang)*distFromBase, p1.y+sin(ang)*distFromBase, 0);
    angle=ang;
  }

  //constrained to keep distance
  //uses law of cosines
  void pullParent(float x, float y) {
    if (parent!=null) {
      float ang=atan2(y-parent.p1.y, x-parent.p1.x);
      float d= dist(x, y, parent.p1.x, parent.p1.y); 
      float beta = acos((sq(parent.distFromBase)+sq(d)-sq(hyp))/(2*parent.distFromBase*d));
      parent.moveAngle(sign*beta+ang);
      moveTo(x, y);
    }
  } 


  float angleTo(float x, float y) {
    return atan2(y-p1.y, x-p1.x);
  }
  /****  distance to points in line ****/
  float toP1(float x, float y) {
    return dist(x, y, p1.x, p1.y);
  }

  float toP2(float x, float y) {
    return dist(x, y, p2.x, p2.y);
  }

  /*** check if a point lies close within th to the line ***/

  boolean inLine(float x, float y, float th) {
    return false;
  }

  /*****  draw functions*/  ///

  void drawLine() {
  //  stroke(255,100);
    line(p1.x, p1.y, p2.x, p2.y);
   // stroke(255,200);
    point( p2.x, p2.y);
  }
}

//creates two lines coupled
class PCoupledLines {
  PLine line1, line2;
  PImage img1,img2;
  //lines coupled anchored in x1,y1
  PCoupledLines(float x1, float y1, int l1, int l2, boolean l) {
    line1 = new PLine(x1, y1, l1, l1);
    if(l){
      line2 = new PLine(x1+10, y1, l2, 0);
    }else{
      line2 = new PLine(x1-10, y1, l2, 0); 
    }
    line2.setParent(line1);
  }

  void update(float x, float y) {
    line2.pullParent(x, y);
    line1.drawLine();
    line2.drawLine();
  }
  
  void setImages(PImage im1, PImage im2){
   img1=im1;
   img2=im2; 
  }
  
  void drawImages(){
    pushMatrix();
    translate(line1.p1.x-50,line1.p1.y);
    rotate(line1.angle-HALF_PI);
    image(img1,0,0);
    popMatrix();
    
    pushMatrix();
    translate(line2.p2.x-50,line2.p2.y);
    rotate(line2.angle-HALF_PI);
    image(img2,0,0);
    popMatrix();
    
  }
}

