PVector ball, vel,acc;
int gridSize =50;//size of the grid
particula[][] tomas = new particula[gridSize][gridSize];

void setup() {
  size(displayWidth, displayHeight);
  ball = new PVector(width/2,height/2);
  vel = new PVector(random(-5,5),random(-5,5));
  acc = new PVector(0.05,0.08);
  for (int i = 0; i<gridSize;i++) {
    for (int j = 0; j<gridSize;j++) {
      //uncomment for regular grid
      tomas[i][j] = new particula(i*width/gridSize, j*height/gridSize);
      //uncomment for random grid
      //tomas[i][j] = new particula(random(width), random(height));
    }
  }
  background(255);
  smooth();
}

void draw() {
  //background(255);
  //saveFrame();
  for (int i = 0; i<gridSize;i++) {
    for (int j = 0; j<gridSize;j++) {
      tomas[i][j].pointTo(ball.x,ball.y,50);
      //display line
      //tomas[i][j].displayLine();
      //display Arrow
      tomas[i][j].displayVector();
    }
  }
  ball.add(vel);
  vel.add(acc);
  if(frameCount%100==0){
    ball.set(width/2,height/2,0);
    vel.set(random(-5,5),random(-5,5));
    //saveFrame();
  }
}

void keyPressed() {
  saveFrame();
}

