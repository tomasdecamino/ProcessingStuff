//criaturas que rebotan
//Tom'as de Camino

int ncrits = 5;
Creature[] crit = new Creature[ncrits];


void setup() {
  size(displayWidth, displayHeight);
  background(0);
  for (int i = 0; i< ncrits; i++) {
    crit[i] = new Creature(random(width), random(height), (int)random(100), 60);
    crit[i].velocity.set(random(-1,1), random(-1,1), 0);
  }
  colorMode(HSB,255,255,255);
}  

void draw() {
  background(0);
  noFill();
  smooth(8);
  //crit.critPosition(mouseX,mouseY);
  //crit.critRotate(0.05);
  for (int i = 0; i< ncrits; i++) {
    crit[i].checkEdges();
    for(int j = i+1; j<ncrits; j++){
   // crit[i].critRotate(random(3));
        crit[j].update();
        crit[j].attract(crit[i].center.x,crit[i].center.y,800);
        if((sqrt(sq(crit[j].center.x-crit[i].center.x)+sq(crit[j].center.y-crit[i].center.y))<200)){
        strokeWeight(5);
        stroke(241,231,231, 145);
        line(crit[j].center.x,crit[j].center.y,crit[i].center.x,crit[i].center.y);
        }
    }
    //crit[i].push(mouseX,mouseY,100);
    stroke(96,231,231, 145);
    strokeWeight(3);
    crit[i].display();
  }
  //ellipse(mouseX,mouseY,100,100);
}

