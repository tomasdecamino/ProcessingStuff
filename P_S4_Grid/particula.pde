//Tomas de Camino Beck
//grid for fluid dynamics tests

class particula {
  PVector position; //position on the grid
  PVector direction; //direction to point the vector
  int sw=1;//stroke Weight
  int lineLength=40;//how long to draw the lines
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


  //display vector a a line
  void displayLine() {
    stroke(0, 50);
    strokeWeight(sw);
    float dx =position.x+direction.x*lineLength;
    float dy =position.y+direction.y*lineLength;
    line(position.x, position.y, dx, dy);
  }

}