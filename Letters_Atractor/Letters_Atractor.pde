Mover[] movers = new Mover[60];

Attractor a;

float g = 1;

void setup() {
  size(displayWidth, displayHeight);
  smooth(8);
  stroke(255);
  a = new Attractor();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(20,260),random(width),random(height)); 
  }
}

void draw() {
  frameRate(30);
  background(0);
  strokeWeight(2);
  a.display();

  for (int i = 0; i < movers.length; i++) {
    stroke(50);
    line(a.location.x,a.location.y ,movers[i].location.x,movers[i].location.y);
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].repel(movers[i]);
        movers[i].applyForce(force);
      }
    }

    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);
    movers[i].checkEdges();
    movers[i].update();
    movers[i].display();
  }
  a.location.x = mouseX;
  a.location.y = mouseY;
  
  

}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      a.mass = (a.mass+2)%40;
    } else if (keyCode == DOWN) {
      a.mass = (a.mass-2)%40;
    } 
  } else {
    a.mass = 2;
  }
}














