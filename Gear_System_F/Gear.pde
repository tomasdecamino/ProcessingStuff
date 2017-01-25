class Gear {
  PVector pos;
  PLine rod;
  PCoupledLines lines;
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
    a=0;
    speed=parentGear.speed;
    clock=parentGear.clock;
    r=radio;
    inside=true;
  }

  Gear(float x, float y, int radio, float s) {
    parentGear=null;    
    pos = new PVector(x, y, radio) ;
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

  void drawRod() {
    if (rod!=null) {
       if(rod.parent!=null){
         rod.drawLine();
         rod.parent.drawLine();
       }
       
        
      //if(rod.parent!=null)rod.parent.drawLine();
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
    if (parentGear!=null) {
      if (inside) {
        speed=parentGear.speed;
      } 
      else {
        speed=parentGear.speed*(float(parentGear.r)/float(r));
      }
    }
    a+=(speed*clock);
    if (rod!=null) {
      if (rod.parent!=null) {
        //rod.parent.moveLine(pos.x+cos(a+gearOffset)*r, pos.y+sin(a+gearOffset)*r);
        rod.pullParent(pos.x+cos(a+gearOffset)*(r-or), pos.y+sin(a+gearOffset)*(r-or));
        //rod.parent.drawLine();
      }
      else { 
        rod.moveLine(pos.x+cos(a+gearOffset)*(r-or), pos.y+sin(a+gearOffset)*(r-or));
        if (rod.parent==null)rod.pointTo(pos.x, 0);
      }
    }
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

