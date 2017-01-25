class Gear {
  PVector pos;
  PLine rod;
  // PVector rodBase;
  // PVector rodTop;
  float or=10;//offset del radio para el rod
  float rodLength=400;
  float x0;
  float y0;
  Gear parentGear;
  float a; //angulo rotaci'on
  float angDisplay;
  float speed=0.01;//velocidad angular
  int clock;
  float teethHeight=15;
  float gearOffset=0;
  int r;
  boolean inside=false;

  Gear(Gear parent, float posAng, int radio) {
    parentGear=parent; 
    angDisplay=  posAng; 
    float x = parentGear.pos.x+sin(posAng)*(parentGear.r+radio+teethHeight);//parentGear.pos.x+parentGear.pos.z/2+diameter/2;
    float y = parentGear.pos.y+cos(posAng)*(parentGear.r+radio+teethHeight);    
    pos = new PVector(x, y, radio) ;

    rod = new PLine(x+radio, y, rodLength, -HALF_PI);/***** REVISAR *******/
    //rodBase = new PVector(x+radio, y, radio-or) ;
    //rodTop = new PVector(0, 0, 0) ;
    parentGear.rod.distFromBase=100;
    rod.setParent(parentGear.rod);
    a=0;
    speed=parentGear.speed*((parentGear.r)/(radio));
    clock=-parentGear.clock;
    r=radio;
    inside=false;
  }

  Gear(Gear parent, int radio) {
    parentGear=parent; 
    angDisplay=  parent.angDisplay; 
    float x = parentGear.pos.x;
    float y = parentGear.pos.y;    
    pos = new PVector(x, y, radio) ;

    rod = new PLine(x+radio, y,rodLength, -HALF_PI);/***** REVISAR *******/
    //rodBase = new PVector(x+radio, y, radio-or) ;
    //rodTop = new PVector(0, 0, 0) ;
    a=0;
    speed=parentGear.speed;
    clock=parentGear.clock;
    r=radio;
    inside=true;
  }

  Gear(float x, float y, int radio, float s) {
    parentGear=null;    
    pos = new PVector(x, y, radio) ;
    
    rod = new PLine(x+radio, y, rodLength, -HALF_PI);/***** REVISAR *******/
    //rodBase = new PVector(x+radio, y, radio-or) ;
    //rodTop = new PVector(0, 0, 0) ;
    a=0;
    speed=s;
    clock=1;
    r=radio;
    inside=false;
  }



  void drawGear(color c, int opacity)
  { 
    int numberOfTeeth=r/5; 
    float teethAngle=TWO_PI/numberOfTeeth;
    float teethWidth=sin(teethAngle/2)*r; 
    float lineY=cos(teethAngle/2)*r+teethHeight;
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a+gearOffset);
    fill(c, opacity);
    stroke(c, opacity);
    for (int i=0; i<numberOfTeeth; i++)
    {  
      rotate(teethAngle);
      noStroke(); 
      strokeWeight(2);
      triangle(-3*teethWidth/4, -lineY+teethHeight, teethWidth/2, -lineY+teethHeight, -teethWidth/2, -lineY);
      triangle(teethWidth/4, -lineY, -teethWidth/2, -lineY, teethWidth/2, -lineY+teethHeight);
    }
    stroke(c, opacity);  
    fill(c, opacity);
    ellipse(0, 0, 2*(-lineY+teethHeight)-3, 2*(-lineY+teethHeight)-3) ;
    ellipse(0, 0, 10, 10) ;
    text(numberOfTeeth, 8, 5);
    popMatrix();
  }

  void drawRod(color c) {
    fill(c);
    ellipse(rod.p1.x, rod.p1.y, 10, 10);
    strokeWeight(10);
    rod.drawLine();
      if (parentGear!=null) {
      line( rod.p2.x, rod.p2.y, parentGear. rod.p2.x, parentGear.rod.p2.y);
      stroke(255, 0, 0, 180);
      strokeWeight(30);
      //line( rod.p2.x, rod.p2.y, parentGear. rod.p2.x, parentGear.rod.p2.y);
    }

  }


  void displayLine() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    ellipse(0, 0, pos.z, pos.z);
    ellipse(pos.z/2-pos.z*0.2, 0, pos.z*0.1, pos.z*0.1);
    line(0, 0, pos.z/2-pos.z*0.2, 0);
    ellipse(0, 0, 10, 10);
    popMatrix();
  }


  void update() {
    rod.moveLine(pos.x+cos(a+gearOffset)*r,pos.y+sin(a+gearOffset)*r);
    if (parentGear!=null) {
      if (inside) {
        speed=parentGear.speed;
      } else {
        speed=parentGear.speed*(float(parentGear.r)/float(r));
        
      }
    }
    a+=(speed*clock);
    //rod.pointTo(pos.x,0);
    //rod.moveAngle(a);
    
    rod.pointTo(pos.x,0);
  }

  void setDisplayAngle(float posAng) {
    float x = parentGear.pos.x+sin(posAng)*(parentGear.r+r);
    float y = parentGear.pos.y+cos(posAng)*(parentGear.r+r);    
    pos.set(x, y, r);
    angDisplay=posAng;
  }


  void setAngle() {
    a+=gearOffset;
  }
}

