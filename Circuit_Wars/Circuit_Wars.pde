PRobot robot;

void setup() {
  size(800, 800);
  robot = new PRobot(width/2, height/2);
}

void draw() {
  background(0);
  strokeWeight(30);
  stroke(255);
  noFill();
  ellipse(width/2,height/2,500,500);
  loadPixels();  
  int loc = int(robot.pos.x) + int(robot.pos.y) * width;
  color c =pixels[loc];
  robot.sense(c);
  strokeWeight(1);
  robot.drawBot();
  robot.move();
}