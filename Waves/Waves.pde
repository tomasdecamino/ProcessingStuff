//Tomas de Camino Beck

int gSize=80;
int s=7;
float a=0.0;
float speed = 0.15;
particle[][] pSystem = new particle[gSize][gSize];

void setup() {
  size(600, 600); 
  for (int i = 0; i<gSize; i++) {
    for (int j = 0; j<gSize; j++) {
      pSystem[i][j] = new particle((float)i*s, (float)j*s, 30.0, (float)(j*i)/350, speed);
    }
  }
  ellipseMode(CENTER);
}

void draw() {
  background(255);
  noFill();
  for (int i = 0; i<gSize; i++) {
    for (int j = 0; j<gSize; j++) {
      if ((i+1)<gSize) {
        line(pSystem[i][j].position.x+pSystem[i][j].dx,pSystem[i][j].position.y+ pSystem[i][j].dy,pSystem[i+1][j].position.x+ pSystem[i+1][j].dx,pSystem[i+1][j].position.y+ pSystem[i+1][j].dy);
      }
      pSystem[i][j].updateDraw();
    }
  }
  //a+=speed;
  //saveFrame("frames/####.jpg");
  //if(a>TWO_PI)exit();
}