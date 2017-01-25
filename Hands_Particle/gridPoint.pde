class gridPoint {
  PVector position; //position on the grid
  PVector direction; //direction to point the vector
  int sw=1;//stroke Weight
  int lineLength=20;//how long to draw the lines
  float ang=0; //angle of the direction vector

  gridPoint(float x, float y) {
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
   /* else {
      direction.x =0;
      direction.y =0;
      ang = 0.0;
    }*/
  }

  // display vector as an arrow
  void displayVector() {
    stroke(0, 50);
    strokeWeight(sw);
    if (ang != 0.0) {
      arrow();
    }
    else {
      point(position.x,position.y);
    }
  }

  //display vector a a line
  void displayLine() {
    stroke(0, 5);
    strokeWeight(sw);
    float dx =position.x+direction.x*lineLength;
    float dy =position.y+direction.y*lineLength;
    line(position.x, position.y, dx, dy);
  }

  //function to draw an arrow
  void arrow() {
    int arrowLength = 5;//this changes the size of arrow head
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

