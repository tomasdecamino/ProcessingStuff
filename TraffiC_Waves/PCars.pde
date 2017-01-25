//@author: Tomas de Camino Beck
// www.funcostarica.org

class PCars {
  PVector pos; //current position in plane
  float speed=1; //speed (same vector speeds)
  float accel=0.05; //acceleration
  PCars front;

  //constructor
  PCars(float x, float y, float speed, PCars front) {
    pos = new PVector(x, y, 0);
    this.speed = speed;
    this.front = front;
  }

  void displayCar() {
  }

  void moveCar(float threshold) {
    int d = (int)pos.dist(front.pos);
    if (d>0 && d>threshold) {
      stroke(0);
      speed+=accel;
      //get vector sign... not the fastest way
      //but easier to understand
      int signX = ceil((front.pos.x-pos.x)/abs(front.pos.x-pos.x));
      //Y is adde for future work with bilateral effects
      int signY = ceil((front.pos.y-pos.y)/abs(front.pos.y-pos.y));
      pos.add(signX*speed, signY*speed, 0);
    } else {
      stroke(255, 0, 0, 150);
      speed-=0.5;
      if (speed<0)speed=0;
    }
  }

  void moveTo(int x, int y) {
    pos.x += (x-pos.x)/(50);
    pos.y += (y-pos.y)/(50);
  }

  void accelerate(float d) {
    speed+=d;
    pos.add(speed, speed, 0);
  }

  void deccelerate(float d) {
    speed-=d;
    speed=constrain(speed,0.5,2);
     pos.add(speed, speed, 0);
  }
}