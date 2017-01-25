PShape bot, bot2;
float a = 0;
float a2 = 0;
float speed=0.01;

void setup() {
  size(640, 360);
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  bot = loadShape("gear26.svg");
  bot2 = loadShape("gear26.svg");
  shapeMode(CENTER);
  ellipseMode(CENTER);
} 

void draw() {
  background(#2D64D6);
  noFill();
  stroke(255,100);
  pushMatrix();

  translate(150, 150);
  rotate(a);
  shape(bot, 0, 0);
  ellipse(0, 0, bot.width-13, bot.width-13);
  popMatrix();
  a+=speed;

  pushMatrix();
  translate(150+bot.width/2+bot2.width/2-13, 150);
  rotate(a2+atan2(22, bot2.width));
  ellipse(0, 0, bot2.width-13, bot2.width-13);
  shape(bot2, 0, 0);
  popMatrix();
  float val = 12.5 ;
  a2-=(speed*((bot.width-val)/2)/((bot2.height-val)/2));
  print(bot.width);
  print(",");
  println(bot.height);
}

