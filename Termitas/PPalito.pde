class PPalito {
  PVector pos;
  boolean taken=false;
  
  PPalito(float x, float y){
    pos = new PVector(x, y, 0);
  }
  
  void display(){
    fill(255,0,0);
    rect(pos.x,pos.y,20,2);
  }
}
