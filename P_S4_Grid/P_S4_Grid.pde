PVector ball, vel, acc;
int gridSize =30;//size of the grid
particula[][] bolas = new particula[gridSize][gridSize];

void setup() {
  size(600, 600);
  ball = new PVector(width/2, height/2);
  vel = new PVector(random(-5, 5), random(-5, 5));
  acc = new PVector(0.05, 0.08);
  for (int i = 0; i<gridSize; i++) {
    for (int j = 0; j<gridSize; j++) {
      bolas[i][j] = new particula(i*width/gridSize, j*height/gridSize);
    }
  }
  background(255);
  smooth();
}

void draw() {
  //background(255);
  for (int i = 0; i<gridSize; i++) {
    for (int j = 0; j<gridSize; j++) {
      bolas[i][j].pointTo(ball.x, ball.y, 20);
      bolas[i][j].displayLine();
    }
  }
  ball.add(vel);
  vel.add(acc);
  //Nueva particula
  if (frameCount%100==0) {
    ball.set(width/2, height/2, 0);
    vel.set(random(-5, 5), random(-5, 5));
  }
}