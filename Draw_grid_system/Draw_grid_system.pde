PVector ball, vel,acc;
int gridSize =50;//size of the grid
particula[][] tomas = new particula[gridSize][gridSize];

void setup() {
  size(displayWidth, displayHeight);
  for (int i = 0; i<gridSize;i++) {
    for (int j = 0; j<gridSize;j++) {
      //uncomment for regular grid
      tomas[i][j] = new particula(i*width/gridSize, j*height/gridSize);
    }
  }
  background(255);
  smooth();
}

void draw() {
  //background(255);
  //saveFrame();
  stroke(255,10);
  for (int i = 0; i<gridSize;i++) {
    for (int j = 0; j<gridSize;j++) {
      tomas[i][j].pointTo(mouseX,mouseY,100);
      //display line
      tomas[i][j].displayLine();
      //display Arrow
      tomas[i][j].displayVector();
    }
  }

}

void keyPressed() {
  saveFrame();
}