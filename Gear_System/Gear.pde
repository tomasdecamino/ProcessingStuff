class Gear {
  PVector pos;
  float x0;
  float y0;
  Gear parentGear;
  float a; //angulo rotaci'on
  float angDisplay;
  float speed=0.01;//velocidad angular
  int dir =1;

  Gear(Gear parent, float posAng, float diameter) {
    parentGear=parent; 
    angDisplay=  posAng; 
    float x = parentGear.pos.x+sin(posAng)*(parentGear.pos.z/2+diameter/2);//parentGear.pos.x+parentGear.pos.z/2+diameter/2;
    float y = parentGear.pos.y+cos(posAng)*(parentGear.pos.z/2+diameter/2);    
    pos = new PVector(x, y, diameter) ;
    a=0;
    dir=parent.dir*-1;
    speed=dir*parentGear.speed*(parentGear.pos.z/diameter);
    
  }

  Gear(float x, float y, float diameter, float s) {
    parentGear=null;    
    pos = new PVector(x, y, diameter) ;
    a=0;
    speed=s;
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    ellipse(0, 0, pos.z, pos.z);
    ellipse(pos.z/2-pos.z*0.2, 0, pos.z*0.1, pos.z*0.1);
    popMatrix();
  }

  void update() {
    a+=speed;
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

