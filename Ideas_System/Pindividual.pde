class PIndividual {
  PVector position;
  int info;
  boolean boss;

  PIndividual(float x, float y, int info, boolean boss) {
    position = new PVector(x, y, 0); 
    this.info = info;
    this.boss = boss;
  }

  void display() {
    if (info>0){
      fill(255,0,0,100);
      ellipse(position.x, position.y, 50, 50);
    }
    else{
      fill(250,250,250,200);
      ellipse(position.x, position.y, 30, 30);
    }
    if(boss){
      fill(0,200,0,100);
      ellipse(position.x, position.y, 40, 40);
    }
  }

  void walk(float step) {
    position.x=constrain(position.x+random(-step, step), 0, width);
    position.y=constrain(position.y+random(-step, step), 0, height);
  }
}