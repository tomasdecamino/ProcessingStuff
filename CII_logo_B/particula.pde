class particula {
  PVector position; //position on the grid
  PVector direction; //direction to point the vector
  PVector origin;
  int sw=1;//stroke Weight
  int lineLength=40;//how long to draw the lines
  float ang=0; //angle of the direction vector
  float oX,oY; //initial position
  int rectSize;
  color pColor;

  particula(float x, float y) {
    origin = new PVector(x, y);
    position = new PVector(x, y);
    direction = new PVector(random(-0.01,0.01), random(-0.01, 0.01));
    rectSize=(int)random(1,5);
  }

 void updateRandom(float x, float y, int th, float prop){ 
   float dx,dy;
   float d =dist(position.x,position.y,x,y);
   if(d<th){
     dx = position.x-x;
     dy = position.y-y;
     //stroke(0);
     position.add(dx*random(0,prop),dy*random(0,prop),0);
   }else{
     dx = origin.x-position.x;
     dy = origin.y-position.y;
     position.add(dx*random(0,prop),dy*random(0,prop),0);
   }
 }


 void update(float x, float y, int th, float prop){ 
   float dx,dy;
   float d =dist(position.x,position.y,x,y);
   if(d<th){
     dx = position.x-x;
     dy = position.y-y;
     //stroke(0);
     position.add(dx*(1-d/th)*prop,dy*(1-d/th)*prop,0);
   }else{
     dx = origin.x-position.x;
     dy = origin.y-position.y;
     position.add(dx*prop,dy*prop,0);
   }
 }
 
 
  void updateAttract(float x, float y, int th, float prop){ 
   float dx,dy;
   float d =dist(position.x,position.y,x,y);
   if(d<th){
     dx = x-position.x;
     dy = y/position.y;
     //stroke(0);
     position.add(dx*(1-d/th)*prop,dy*(1-d/th)*prop,0);
   }else{
     dx = origin.x-position.x;
     dy = origin.y-position.y;
     position.add(dx*prop,dy*prop,0);
   }
 }
 
  void updateAttractRandom(float x, float y, int th, float prop){ 
   float dx,dy;
   float d =dist(position.x,position.y,x,y);
   if(d<th){
     dx = x-position.x;
     dy = y-position.y;
     //stroke(0);
     position.add(dx*random(0,prop),dy*random(0,prop),0);
   }else{
     dx = origin.x-position.x;
     dy = origin.y-position.y;
     position.add(dx*random(0,prop),dy*random(0,prop),0);
   }
 }
 
 void updateAlldirection(float x, float y, int th, float prop){ 
   float dx,dy;
   float d =dist(position.x,position.y,x,y);
   if(d<th){
     dx = random(-50,50);
     dy = random(-50,50);
     //stroke(0);
     position.add(dx*(1-d/th)*prop,dy*(1-d/th)*prop,0);
   }else{
     dx = origin.x-position.x;
     dy = origin.y-position.y;
     position.add(dx*prop,dy*prop,0);
   }
 }
 
 
  void updateSize(float x, float y, int th, float prop){ 
   float dx,dy;
   if(dist(position.x,position.y,x,y)<th){
     dx = position.x-x;
     dy = position.y-y;
     //stroke(0);
     position.add(dx*random(0,prop),dy*random(0,prop),0);
     rectSize=(int)dx/40;
   }else{
     dx = origin.x-position.x;
     dy = origin.y-position.y;
     position.add(dx*random(0,0.1),dy*random(0,0.1),0);
     rectSize=(int)dx/40;
   }

 }

//display functions
  void displayRect(){
    rect(position.x,position.y,rectSize,rectSize);
  }
 
  
  void displayRect(int s){
    rect(position.x,position.y,s,s);
  }

  void displayEllipse(){
    ellipse(position.x,position.y,rectSize,rectSize);
  }
  void displayEllipse2(){
    ellipse(position.x,position.y,abs(position.x-origin.x),abs(position.x-origin.x));
  }  
  
  void displayRect2(){
    rect(position.x,position.y,abs(position.x-origin.x),abs(position.x-origin.x));
  }  
    
  
  
  void displayEllipse(int s){
    ellipse(position.x,position.y,s,s);
  }


  //function to point direction to x,y
  void pointTo(float x, float y) {
    float dist = dist(position.x, position.y, x, y);
    ang = atan2(y-position.y, x-position.x);
    direction.x = cos(ang);
    direction.y = sin(ang);
  }
  //function to point direction to x,y within a threshold
  void pointTo(float x, float y, float th) {
    float dist = dist(position.x, position.y, x, y);
    if (dist<th) {
      ang = atan2(y-position.y, x-position.x);
      direction.x = cos(ang);
      direction.y = sin(ang);
    }
    else {
      direction.x =0;
      direction.y =0;
      ang = 0.0;
    }
  }

  // display vector as an arrow
  void displayVector() {
    stroke(0, 5);
    strokeWeight(sw);
    if (ang != 0.0) {
      arrow();
    }
    else {
      point(position.x,position.y);
    }
  }

  //display vector a a line
  void displayLine() {
   // stroke(0, 10);
   // strokeWeight(sw);
    float dx =position.x+direction.x*lineLength;
    float dy =position.y+direction.y*lineLength;
    line(position.x, position.y, dx, dy);
  }

  //function to draw an arrow
  void arrow() {
    int arrowLength = 2;//this changes the size of arrow head
    pushMatrix();
    //cambia el eje del dibujo y lo rota
    translate(position.x, position.y);
    rotate(ang);
    //draw line in the x axis of lineLength
    line(0, 0, lineLength, 0);
    line(lineLength, 0, lineLength - arrowLength, -arrowLength);
    line(lineLength, 0, lineLength - arrowLength, arrowLength);
    popMatrix();
  }
}