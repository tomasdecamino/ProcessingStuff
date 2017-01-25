// @author Tomas de camino Beck 
// Presentacion TEDx Pura Vida 26 Febrero de 2015

PFont font;
int slide =0;
//arreglos para los doodles
ArrayList<PVector> balls = new ArrayList<PVector>();
ArrayList<PVector> colors = new ArrayList<PVector>();

void setup() {
  size(displayWidth, displayHeight); 

  font = loadFont("Simplicity-48.vlw");
  textFont(font, 38);
  frameRate(10);
  strokeCap(ROUND);
  strokeJoin(ROUND);
}

void draw() {
  textFont(font, 38);
  switch(slide) {
  case 0://Slide de Inicio
    background(0);
    text("SLIDE 0", width/2-textWidth("SLIDE 0")/2, height/2);
    break;
  case 1: //slide particles
    background(255);
    text("SLIDE 1", width/2, height/2);
    break;  
  case 2://Slide pythagoras theorem
    fill(255, 100);
    noStroke();
    rect(0, 0, width, height);
    drawPytB(300+random(-1, 1), 100+random(-1, 1), mouseY, map(mouseX, 0, width, 0, 200));
    break;
  case 3: //pyhtagoras formula
    background(255);
    drawPyt(300+random(-1, 1), 100+random(-1, 1), mouseY, map(mouseX, 0, width, 0, 200));
    drawTheorem(50+random(-1, 1), 50+random(-1, 1));
    break;
  case 4:  
    background(255);
    drawTriangle(300+random(-1, 1), 100+random(-1, 1), mouseY, map(mouseX, 0, width, 0, 200));
    fill(0);
    text("a^2 + b^2 = h^2 ", 500+random(-1, 1), 200);
    break;
  case 5:  
    fill(255, 100);
    noStroke();
    rect(0, 0, width, height);
    drawSquare(300+random(-1, 1), 300+random(-1, 1), mouseY, map(mouseX, 0, width, 0, 200));
    text("a^2 + b^2 = h^2 ", 500+random(-1, 1), 200);
    break;
  case 6://arbol de pitagoras nivel 1 
    background(255);
    fill(0);
    stroke(0);
    drawPythagoras(width/2-100, height-200, 200, 1);
    break;
  case 7://arbol de pitagoras nivel 1 
    background(255);
    fill(0);
    stroke(0);
    drawPythagoras(width/2-100, height-200, 200, 2);
    break;
  case 8://arbol de pitagoras  3 niveles
    background(255);
    fill(0);
    stroke(0);
    drawPythagoras(width/2-100, height-200, 200, 3);
    break;
  case 9://arbol pitagoras 8 niveles
    background(255);
    fill(0);
    drawPythagoras(width/2-100, height-200, 200, 8);
    break;
  case 10://arbol pitagoras arte
    fill(255, 2);
    rect(0, 0, width, height);
    stroke(map(mouseY, 0, height, 255, 0));
    strokeWeight(3);
    fill(map(mouseY, 0, height, 0, 255));
    drawPythagoras(width/2-100, height-200, 200, 6);
    break;
  case 11://transicion
    background(#C9C7B5);
    noStroke();
    fill(#91AD9B, 100);
    quad(0, 0, width, height-100, width, height, 0, 10);
    fill(#D6B65F, 50);
    quad(-10, height+10, width, -100, width, 0, 0, height);
    break;
  case 12:
    if (keyPressed && key=='d') {
      float r = random(10, 300);
      noStroke();
      fill(random(255), random(255), 100, 100);
      ellipse(mouseX, mouseY, r+10, r+10);
      fill(random(255), random(255), 100, 100);
      ellipse(mouseX, mouseY, r, r);
      stroke(0);
      line(mouseX+random(-50, 50), mouseY+random(-50, 50), mouseX+random(-1000, 1000), mouseY+random(-1000, 1000));
    }
    break;
  case 13:
    background(255);
    break;
  case 14:
    drawDoodles();
    break;
  }
}

/****************************************
 ******** FUNCIONES ***************/

//dubuja teorema con colres
void drawPyt(float x, float y, float side, float a) {
  float b = side-a;
  noFill();
  stroke(#0518B4);
  rect(x, y, side, side);
  rect(x, y, side/20, side/20);
  pushMatrix();
  translate(x+a, y);
  fill(0);
  if (a>10) {
    text("b", -(a+30), b/2);
    text("a", -a/2, -10);
  }

  float ang = atan2(b, a);
  pushMatrix();
  rotate(HALF_PI-ang);
  float h =sqrt(sq(a)+sq(b));
  fill(255);
  stroke(#EDCF35);
  strokeWeight(4);
  rect(0, 0, h, h);
  fill(0);
  text("h", 5, side/2-textWidth("h")); 
  popMatrix();
  noFill();
  stroke(#EA4040);
  strokeWeight(4);
  triangle(0, 0, -a, 0, -a, b); 
  popMatrix();
}

//dibuja teorema en negro
void drawPytB(float x, float y, float side, float a) {
  float b = side-a;
  noFill();
  stroke(0);
  rect(x, y, side, side);
  rect(x, y, side/20, side/20);
  pushMatrix();
  translate(x+a, y);
  fill(0);
  if (a>10) {
    text("b", -(a+30), b/2);
    text("a", -a/2, -10);
  }

  float ang = atan2(b, a);
  pushMatrix();
  rotate(HALF_PI-ang);
  float h =sqrt(sq(a)+sq(b));
  fill(255);
  stroke(0);
  strokeWeight(2);
  rect(0, 0, h, h);
  fill(0);
  text("h", 5, side/2-textWidth("h")); 
  popMatrix();
  popMatrix();
}


//escribe la igualdad del teorema
void drawTheorem(float x, float y) {
  fill(#0518B4);
  text("(a+b)^2", x, y);
  fill(#EA4040);
  text("= 4 a*b/2 ", x+textWidth("(a+b)^2"), y);
  fill(#EDCF35);
  text("+ c^2", x+textWidth("(a+b)^2= 4 a*b/2 "), y);
}

//dibuja un triangulo rectangulo
void drawTriangle(float x, float y, float s, float a) {
  float b = s-a;
  noFill();
  stroke(#0518B4);
  rect(x, y, s/20, s/20);
  pushMatrix();
  translate(x+a, y);
  fill(0);
  if (a>10) {
    text("b", -(a+30), b/2);
    text("a", -a/2, -10);
  }
  float ang = atan2(b, a);
  pushMatrix();
  rotate(HALF_PI-ang);
  float h =sqrt(sq(a)+sq(b));
  text("h", 5, s/2-textWidth("h")); 
  popMatrix();
  noFill();
  stroke(#EA4040);
  strokeWeight(4);
  triangle(0, 0, -a, 0, -a, b); 
  popMatrix();
}

void drawSquare(float x, float y, float s, float a) {
  float b = s-a;
  noFill();
  stroke(#0518B4);
  rect(x, y, s/20, s/20);
  pushMatrix();
  translate(x+a, y);
  fill(0);
  if (a>10) {
    text("b", -(a+30), b/2);
    text("a", -a/2, -10);
  }
  float ang = atan2(b, a);
  pushMatrix();
  rotate(HALF_PI-ang);
  float h =sqrt(sq(a)+sq(b));
  text("h", 5, s/2-textWidth("h"));
  noFill();
  stroke(#EA4040);
  rect(0, 0, h, h); 
  popMatrix();
  noFill();
  stroke(#EA4040);
  strokeWeight(4);
  triangle(0, 0, -a, 0, -a, b); 
  rect(0, 0, -a, -a);
  rect(-a, 0, -b, b);
  popMatrix();
}


//dibuja arbol de pitagoras
void drawPythagoras(int x, int y, int h, int levels) {
  rect(x, y, h, h);
  catetos(x, y, h, levels);
}

//dibuja catetos del arbol de pitagoras
void catetos(float x, float y, float h, int level) {
  if (level>0) {
    pushMatrix();
    translate(x, y);
    //calcuates sides abd angles
    float a = map(mouseX, 0, width, 0, h);
    float b=sqrt(sq(h)-sq(a));
    float ang = PI+atan2(b, a);
    float angA = TWO_PI+(ang);
    //rect(0,0,h,h);

    //draws right squares
    pushMatrix();
    translate(h, 0);
    rotate(ang);
    rect(0, 0, a, a);
    rotate(PI);
    catetos(-a+random(-1, 1), -a+random(-1, 1), a, level-1);
    popMatrix();

    //draws left square
    pushMatrix();
    rotate(angA);
    rect(0, 0, b, b);
    translate(b, 0);
    rotate(HALF_PI);
    catetos(0+random(-1, 1), 0+random(-1, 1), b, level-1);
    popMatrix();  

    popMatrix();
  }
}

void drawDoodles() {
  for (int i = 0; i < balls.size(); i++) {
    PVector part = balls.get(i);
    PVector c = colors.get(i);
    stroke(0, 50);
    fill(c.x, c.y, c.z, 200);
    strokeWeight(1);
    ellipse(part.x, part.y, part.z, part.z);
    float r= part.z/2;
    //part.add(sin(r)*10,sin(r)*10, 0);
    part.add(random(-r/2, r/2), random(-r, r/3), 0);
    part.z*=0.95;
    if (part.z<1) {
      balls.remove(i);
      colors.remove(i);
    }
  }
}



void keyPressed() {  
  if (key =='a' ) {
    slide++;
  } 
  if (key =='s' ) {
    slide--;
  }
  if (key=='d'&& slide==14) {
    for (int i =0;i<50;i++) {
      balls.add(new PVector(mouseX+random(-100, 100), mouseY, random(100)));
      colors.add(new PVector(random(255), random(255), random(100, 255)));
      //ellipse(x, y, 10, 10);
    }
  }
}

