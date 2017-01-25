// Clase creature
// Tomás de Camino Beck

class Creature{
  PVector center;
  PVector[] cillium;
  int numCillium ;
  float l;
  float ang;
  PVector velocity;
  
  Creature(float x, float y,float len,int n){
    numCillium = n;
    ang = TWO_PI/numCillium;
    l = len;
    //numCillium = n;
    center = new PVector(x, y);
    velocity = new PVector(0, 0);
    cillium = new PVector[numCillium];
    for(int i=0; i < numCillium; i++){
        cillium[i]=new PVector(x+l*cos(i*ang), y+l*sin(i*ang));
    }
    
  }
  
  void display(){
     for(int i=0; i<numCillium;i++){
         //ellipse(center.x,center.y,10,10);
         int range = 18;
         beginShape();
            curveVertex(center.x,center.y); // the first control point
            curveVertex(center.x,center.y); // is also the start point of curve
            curveVertex(center.x+random(-range,range),center.y+random(-range,range));
            curveVertex(cillium[i].x+random(-range,range),cillium[i].y+random(-range,range));
            curveVertex(cillium[i].x,cillium[i].y); // the last point of curve
            curveVertex(cillium[i].x,cillium[i].y); // is also the last control point
         endShape();
     } 
  }

   void critRotate(float angle){
     for(int i=0; i < numCillium; i++){
        cillium[i].x = center.x+ l*cos(i*(ang+angle));
        cillium[i].y = center.y + l*sin(i*(ang+angle));    
    } 
    ang += angle;
   }
    
    void critPosition(float x, float y){
        center.set(x,y,0);
        for(int i=0; i < numCillium; i++){
         cillium[i]=new PVector(x+l*cos(i*ang), y+l*sin(i*ang));
        }
    }
    
    void update(){
       center.add(velocity);
       for(int i=0; i < numCillium; i++){
         cillium[i].add(velocity);
       }
       if(velocity.mag()>0){
         velocity.mult(0.95);
       } else{
         velocity.setMag(0);
       }
    }
    
    void checkEdges(){
      if(center.x<0){
        velocity.x*=-2;
        critPosition(0,center.y);
      }else if(center.x>width){
        velocity.x*=-2;
        critPosition(width,center.y);  
      }
 
      if(center.y < 0){
        velocity.y*=-2;
        critPosition(center.x,0);
      }else if(center.y > height){
        velocity.y*=-2;
        critPosition(center.x,height);
      }
    }
//interaccion con otros    
    void push(float x, float y, float th){
     float dx = x - center.x;
     float dy = y - center.y;
     float mag =sqrt(sq(dx)+sq(dy));
     if(mag < th+l){
      velocity.sub(mag/(th*100) *dx, mag/(th*100) * dy,0);
      update(); 
     } 
    }
    
//atraccion    
    void attract(float x, float y, float th){
     float dx = center.x-x;
     float dy = center.y-y;
     float mag =sqrt(sq(dx)+sq(dy));
     if(mag > th+l){
        center.sub(dx, dy,0);
        critPosition(center.x,center.y);
     } 
    }
   
    
}
