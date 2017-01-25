class Gear {
  PVector pos;
  float x0;
  float y0;
  Gear parentGear;
  float a; //angulo rotaci'on
  float angDisplay;
  float speed=0.01;//velocidad angular
  int clock;

  Gear(Gear parent, float posAng, float diameter) {
    parentGear=parent; 
    angDisplay=  posAng; 
    float x = parentGear.pos.x+sin(posAng)*(parentGear.pos.z/2+diameter/2);//parentGear.pos.x+parentGear.pos.z/2+diameter/2;
    float y = parentGear.pos.y+cos(posAng)*(parentGear.pos.z/2+diameter/2);    
    pos = new PVector(x, y, diameter) ;
    a=0;
    speed=parentGear.speed*(parentGear.pos.z/diameter);
    clock=-parentGear.clock;
  }

  Gear(float x, float y, float diameter, float s) {
    parentGear=null;    
    pos = new PVector(x, y, diameter) ;
    a=0;
    speed=s;
    clock=1;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    ellipse(0, 0, pos.z, pos.z);
    ellipse(0, 0, 10, 10);
    triangle(pos.z/2, 0,pos.z/2-10,-10,pos.z/2-10,10);
    pushMatrix();
    translate(pos.z/2, 0);
    rotate(-a);
    line(0, 0,0,200);
    popMatrix();
    popMatrix();
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
    if (parentGear!=null) {
      speed=parentGear.speed*(parentGear.pos.z/pos.z);
    }
    a+=(speed*clock);
  }

  void setDisplayAngle(float posAng) {
    float x = parentGear.pos.x+sin(posAng)*(parentGear.pos.z/2+pos.z/2);
    float y = parentGear.pos.y+cos(posAng)*(parentGear.pos.z/2+pos.z/2);    
    pos.set(x, y, pos.z);
    angDisplay=posAng;
  }

  void setDiameter(float diameter) {
    float x = parentGear.pos.x+sin(angDisplay)*(parentGear.pos.z/2+diameter/2);
    float y = parentGear.pos.y+cos(angDisplay)*(parentGear.pos.z/2+diameter/2);    
    pos.set(x, y, diameter) ;
    speed=parentGear.speed*(parentGear.pos.z/diameter);
  }
}

