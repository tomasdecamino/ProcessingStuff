int gridSize = 50;//size of the grid
particula[][] tomas = new particula[gridSize][gridSize];

void setup() {
  size(800, 800);
  for (int i = 0; i<gridSize;i++) {
    for (int j = 0; j<gridSize;j++) {
      //uncomment for regular grid
      //tomas[i][j] = new particula(i*width/gridSize, j*height/gridSize);
      //uncomment for random grid
      tomas[i][j] = new particula(random(width), random(height));
    }
  }
  background(255);
  smooth();
}

void draw() {
  //background(255);
  for (int i = 0; i<gridSize;i++) {
    for (int j = 0; j<gridSize;j++) {
      tomas[i][j].pointTo(mouseX,mouseY,100);
      //display line
      //tomas[i][j].displayLine();
      //display Arrow
      tomas[i][j].displayVector();
    }
  }
}

class particula {
  PVector position; //position on the grid
  PVector direction; //direction to point the vector
  int sw=1;//stroke Weight
  int lineLength=20;//how long to draw the lines
  float ang=0; //angle of the direction vector

  particula(float x, float y) {
    position = new PVector(x, y);
    direction = new PVector(random(-1, 1), random(-1, 1));
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
    stroke(0, 10);
    strokeWeight(sw);
    if(ang != 0.0){
    arrow();
    }
  }

  //display vector a a line
  void displayLine() {
    stroke(0, 100);
    strokeWeight(sw);
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


