// @author Tomas de camino Beck 
// Presentacion TEDx Pura Vida 26 Febrero de 2015

PFont font;
PFont font2;
int slide =-1;
//arreglos para los doodles
ArrayList<PVector> balls = new ArrayList<PVector>();
ArrayList<PVector> colors = new ArrayList<PVector>();
//arreglo para pincel
ArrayList<PVector> pincel = new ArrayList<PVector>();

//variables para particulas
int n = 30;
int area=100; 
int repulsion=50;
int bots=20;
float[][] position=new float[n][2];

//codigo en texto
String[] code;
int l=0;

PVector doodle;

void setup() {
  size(displayWidth, displayHeight); 

  font = loadFont("Simplicity-48.vlw");
  font2 = loadFont("Courier-Bold-48.vlw");
  textFont(font, 38);
  frameRate(12);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  for (int i=0;i<7;i++) {
    pincel.add(new PVector(width/2, height/2, 0));
  }
  for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
    position[bola][0]= random(0, width);
    position[bola][1]= random(0, height);
  }
  code = loadStrings("code.txt");
  background(0);

  cursor(CROSS);
  noCursor();
  smooth();
  mouseX=width/2;
  mouseY=height/2;
  doodle= new PVector(width/2, height/2, 100);
}

void draw() {
  textFont(font, 38);
  switch(slide) {
  case -1:
    background(255);
    stroke(0, 100);
    mouseX=width/2;
    mouseY=height/2;
    break;
  case 0://Slide de Inicio
    //background(0);
    //text("SLIDE 0", width/2-textWidth("SLIDE 0")/2, height/2);
    fill(0, 20);
    float  ra =1;//(1+sin(frameCount/2))/2;
    ellipse(mouseX, mouseY, 100*ra, 100*ra);
    break;
  case 1: //slide particles few
    fill(255, 200);
    noStroke();
    rect(-10, -10, width+10, height+10);
    //background(0);
    //stroke(0, 100, 255, 100);
    strokeWeight(3);
    //noStroke();
    //fill(255, 0, 0,100);
    particleSystem(8, 10000, 300);
    break; 
  case 2: //slide particles many
    fill(255, 220);
    rect(-10, -10, width+10, height+10);
    //background(0);
    //stroke(0, 100, 255, 100);
    strokeWeight(3);
    //noStroke();
    //fill(255, 0, 0,100);
    particleSystem(30, 80, 200);
    break; 
  case 3://square
    fill(255, 100);
    noStroke();
    rect(0, 0, width, height);
    noFill();
    stroke(0);
    rect(300+random(-1, 1), 100+random(-1, 1), height-300, height-300);
    break;
  case 4://Slide pythagoras theorem
    fill(255, 100);
    noStroke();
    rect(0, 0, width, height);
    drawPytB(300+random(-1, 1), 100+random(-1, 1), height-300, map(mouseX, 0, width, 0, 200));    
    break;
  case 5://Slide pythagoras theorem
    fill(255, 100);
    noStroke();
    rect(0, 0, width, height);
    drawPytB(300+random(-1, 1), 100+random(-1, 1), height-300, map(mouseX, 0, width, 0, 200));
    drawTri(300+random(-1, 1), 100+random(-1, 1), height-300, map(mouseX, 0, width, 0, 200));
    break;    
  case 6://Slide pythagoras theorem color
    fill(255, 100);
    noStroke();
    rect(0, 0, width, height);
    drawPyt(300+random(-1, 1), 100+random(-1, 1), height-300, map(mouseX, 0, width, 0, 200), true, true);
    break;
  case 7: //pyhtagoras formula
    background(255);
    drawPyt(300+random(-1, 1), 100+random(-1, 1), height-300, map(mouseX, 0, width, 0, 200), true, false);
    drawTheoremA(100+random(-1, 1), 300+random(-1, 1));
    break;    
  case 8: //pyhtagoras formula
    background(255);
    drawPyt(300+random(-1, 1), 100+random(-1, 1), height-300, map(mouseX, 0, width, 0, 200), false, false);
    drawTheoremB(100+random(-1, 1), 300+random(-1, 1));
    break;
  case 9: //pyhtagoras formula
    background(255);
    drawPyt(300+random(-1, 1), 100+random(-1, 1), height-300, map(mouseX, 0, width, 0, 200), false, true);
    drawTheoremC(500+random(-1, 1), 300+random(-1, 1));
    break;
  case 10: //pyhtagoras formula
    background(255);
    drawPyt(300+random(-1, 1), 100+random(-1, 1), height-300, map(mouseX, 0, width, 0, 200), true, true);
    drawTheorem(400+random(-1, 1), 300+random(-1, 1));
    break;
  case 11:
    background(255);
    textSize(68);
    drawTheorem(400+random(-1, 1), 300+random(-1, 1));
    break;
  case 12:
    fill(255, 50);
    rect(-10, -10, width+10, height+10);
    textSize(68);
    //drawTheorem(400+random(-1, 1), 300+random(-1, 1));
    fill(0);
    text("a", 500+random(-1, 1), 400);
    text("2", 500+random(-1, 1)+textWidth("a"), 400-10);
    text(" + b", 500+random(-1, 1)+textWidth("a2"), 400);
    text("2", 500+random(-1, 1)+textWidth("a2 + b"), 400-10);
    text(" = h", 500+random(-1, 1)+textWidth("a2 + b2"), 400);
    text("2", 500+random(-1, 1)+textWidth("a2 + b2 = h"), 400-10); 
    break;  
  case 13:  //rectangle triangle
    fill(255, 100);
    rect(-10, -10, width+10, height+10);
    drawTriangle(300+random(-1, 1), 100+random(-1, 1), height-300, 250);
    fill(0);
    textSize(68);
    text("a", 600+random(-1, 1), 200);
    text("2", 600+random(-1, 1)+textWidth("a"), 200-10);
    text(" + b", 600+random(-1, 1)+textWidth("a2"), 200);
    text("2", 600+random(-1, 1)+textWidth("a2 + b"), 200-10);
    text(" = h", 600+random(-1, 1)+textWidth("a2 + b2"), 200);
    text("2", 600+random(-1, 1)+textWidth("a2 + b2 = h"), 200-10);    
    break;
  case 14:  
    fill(255, 150);
    noStroke();
    rect(0, 0, width, height);
    drawSquare(500+random(-1, 1), 200+random(-1, 1), mouseY, map(mouseX, 0, width, 0, 200));
    text("a", 800+random(-1, 1), 200);
    text("2", 800+random(-1, 1)+textWidth("a"), 200-10);
    text(" + b", 800+random(-1, 1)+textWidth("a2"), 200);
    text("2", 800+random(-1, 1)+textWidth("a2 + b"), 200-10);
    text(" = h", 800+random(-1, 1)+textWidth("a2 + b2"), 200);
    text("2", 800+random(-1, 1)+textWidth("a2 + b2 = h"), 200-10);
    break;
  case 15://arbol de pitagoras nivel 1 
    textSize(38);
    background(255);
    fill(0);
    stroke(0);
    drawPythagoras(width/2-100, height-200, 200, 1);
    break;
  case 16://arbol de pitagoras nivel 1 
    background(255);
    fill(0);
    stroke(0);
    drawPythagoras(width/2-100, height-200, 200, 2);
    break;
  case 17://arbol de pitagoras  3 niveles
    background(255);
    fill(0);
    stroke(0);
    drawPythagoras(width/2-100, height-200, 200, 3);
    break;
  case 18://arbol pitagoras 8 niveles
    background(255);
    fill(0);
    drawPythagoras(width/2-100, height-200, 200, 8);
    break;
  case 19://arbol pitagoras arte
    fill(255, 10);
    rect(-10, -10, width+10, height+10);
    stroke(0, 250);
    //stroke(map(mouseY, 0, height, 255, 0),map(mouseX, 0, width, 255, 0),200);
    strokeWeight(3);
    //noFill();
    //fill(map(mouseY, 0, height, 255, 0),map(mouseX, 0, width, 255, 0),100);
    fill(255,250);
    drawPythagoras(width/2-100, height-200, 200, 6);
    break;
  case 20://transicion
    background(0);
    mouseX=width/2;
    mouseY=height/2;
    break;
  case 21:
    stroke(40);
    drawStrokes(false);
    break; 
  case 22://trazos de dibujo
    fill(0, 50);
    rect(-10, -10, width+10, height+10);   
    textFont(font2, 28);
    //background(0);
    drawStrokes(true);
    break;
  case 23:
    fill(0, 10);
    rect(-10, -10, width+10, height+10);  
    textFont(font2, 28);
    //background(0);
    drawStrokesB(true);
    break;   
  case 24:
    fill(0, 30);
    rect(-10, -10, width+10, height+10);
    drawOneDoodles();
    break;      
  case 25:
    drawDoodles();
    break;   
  case 26:
    fill(0, 50);
    rect(-10, -10, width+10, height+10);
    break;
  case 27:
    fill(0, 15);
    rect(-10, -10, width+10, height+10);
    stroke(0);  
    textFont(font2, 38);
    fill(#07DE28, 255);
    //fill(random(255), random(255), random(255), 200);
    text(code[frameCount%code.length], 100, l%height);
    l+=42;
    break;
  case 28:
    fill(0, 15);
    rect(-10, -10, width+10, height+10);
    break;
  }
}

/****************************************
 ******** FUNCIONES ***************/
//dibuja particulas

void particleSystem(int b, int rep, int a) {
  bots= b;
  repulsion=rep;
  area = a;
  for (int bola=0;bola<bots;bola++) {
    float r=50;//random(5, 300);
    for (int j=0;j<bots;j++) {
      //calcula la distancia de bola a j
      float d=dist(position[bola][0], position[bola][1], position[j][0], position[j][1]);
      //si la otra boal esta a menos de 10 pixeles y no es ella misma
      if (d<area ) {//&& bola!=j
        stroke(50, 50);
        line(position[bola][0], position[bola][1], position[j][0], position[j][1]);
        // position[bola][0]+=repulsion*exp(-abs(position[bola][0]-position[j][0]));
        // position[bola][1]+=repulsion*exp(-abs(position[bola][1]-position[j][1]));
        position[bola][0]+=(position[bola][0]-position[j][0])/repulsion;
        position[bola][1]+=(position[bola][1]-position[j][1])/repulsion;
      }
      else {
        if (bola!=j) {
          position[bola][0]+=(mouseX-position[bola][0])/1000;//X
          position[bola][1]+=(mouseY-position[bola][1])/1000;//Y
        }
      }
    }
    //stroke(255, 64, 139, 200);
    fill(0, 200);
    text(bola, position[bola][0], position[bola][1]-20);
    //noFill();
    //fill(0, 200);
    ellipse(position[bola][0], position[bola][1], 20, 20);
  }
}



//dubuja teorema con colres
void drawPyt(float x, float y, float side, float a, boolean co, boolean ci) {
  float b = side-a;
  noFill();
  if (co) {
    stroke(#0518B4);
  }
  else {
    stroke(0);
  }
  strokeWeight(15);
  rect(x, y, side, side);
  rect(x, y, side/20, side/20);
  strokeWeight(10);
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
  if (ci) {
    stroke(#EDCF35);
  }
  else {
    stroke(0);
  }
  strokeWeight(10);
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

void drawTri(float x, float y, float side, float a) {
  float b = side-a;
  noFill();
  rect(x, y, side/20, side/20);
  strokeWeight(10);
  pushMatrix();
  translate(x+a, y);
  fill(0);
  if (a>10) {
    text("b", -(a+30), b/2);
    text("a", -a/2, -10);
  }

  float ang = atan2(b, a);
  noFill();
  stroke(#EA4040);
  strokeWeight(7);
  triangle(0, 0, -a, 0, -a, b); 
  popMatrix();
}

void drawTriSq(float x, float y, float side, float a) {
  float b = side-a;
  noFill();
  stroke(#0518B4);
  strokeWeight(15);
  rect(x, y, side, side);
  rect(x, y, side/20, side/20);
  strokeWeight(10);
  pushMatrix();
  translate(x+a, y);
  fill(0);
  if (a>10) {
    text("b", -(a+30), b/2);
    text("a", -a/2, -10);
  }

  float ang = atan2(b, a);
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
  //rect(x, y, side/20, side/20);
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
  text("(a+b)", x, y);
  text("2", x+textWidth("(a+b)"), y-10);
  fill(#EA4040);
  text("= 4 a*b/2 ", x+textWidth("(a+b)^2"), y);
  fill(#EDCF35);
  text("+ h", x+textWidth("(a+b)^2= 4 a*b/2 "), y);
  text("2", x+textWidth("(a+b)^2= 4 a*b/2 + h"), y-10);
}

void drawTheoremA(float x, float y) {
  fill(#0518B4);
  text("(a+b)", x, y);
  text("2", x+textWidth("(a+b)"), y-10);
}

void drawTheoremB(float x, float y) {
  fill(#EA4040);
  text("4 a*b/2 ", x, y);
}

void drawTheoremC(float x, float y) {
  fill(#EDCF35);
  text("h", x, y);
  text("2", x+textWidth("h"), y-10);
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


void drawStrokesB(boolean t) {
  //fill(random(255), random(255), random(255), 150);
  noFill();
  strokeWeight(2);
  stroke(255);
  beginShape();
  vertex(pincel.get(0).x, pincel.get(0).y);
  bezierVertex(pincel.get(1).x, pincel.get(1).y, 
  pincel.get(2).x, pincel.get(2).y, 
  pincel.get(3).x, pincel.get(3).y);
  bezierVertex(pincel.get(4).x, pincel.get(4).y, 
  pincel.get(5).x, pincel.get(5).y, 
  pincel.get(6).x, pincel.get(6).y);
  endShape();
  int r = 60;
  beginShape();
  if (t) {
    fill(255, 100);
    text((int)pincel.get(2).x, pincel.get(2).x, pincel.get(2).y);
    text((int)pincel.get(2).y, pincel.get(2).x+80, pincel.get(2).y);
    line(pincel.get(0).x, pincel.get(0).y, pincel.get(1).x, pincel.get(1).y);
    //fill(random(255), random(255), random(255), 150);
  }
  noFill();
  vertex(pincel.get(2).x, pincel.get(2).y);
  bezierVertex(pincel.get(3).x+random(-r, r), pincel.get(3).y+random(-r, r), 
  pincel.get(4).x, pincel.get(4).y, 
  pincel.get(5).x, pincel.get(5).y);
  endShape();
  if (t) {
    stroke(255, 150);
    triangle(pincel.get(0).x, pincel.get(0).y, pincel.get(3).x, pincel.get(3).y, 
    pincel.get(5).x, pincel.get(5).y);
  }  
  pincel.remove(0);
  pincel.add(new PVector(mouseX, mouseY, 0));
}


void drawStrokes(boolean t) {
  fill(random(255), random(255), random(255), 150);
  strokeWeight(1);
  strokeWeight(1);
  stroke(255);
  beginShape();
  vertex(pincel.get(0).x, pincel.get(0).y);
  bezierVertex(pincel.get(1).x, pincel.get(1).y, 
  pincel.get(2).x, pincel.get(2).y, 
  pincel.get(3).x, pincel.get(3).y);
  bezierVertex(pincel.get(4).x, pincel.get(4).y, 
  pincel.get(5).x, pincel.get(5).y, 
  pincel.get(6).x, pincel.get(6).y);
  endShape();
  int r = 60;
  beginShape();
  if (t) {
    fill(255, 100);
    text((int)pincel.get(2).x, pincel.get(2).x, pincel.get(2).y);
    text((int)pincel.get(2).y, pincel.get(2).x+80, pincel.get(2).y);
    line(pincel.get(0).x, pincel.get(0).y, pincel.get(1).x, pincel.get(1).y);
    fill(random(255), random(255), random(255), 150);
  }
  vertex(pincel.get(2).x, pincel.get(2).y);
  bezierVertex(pincel.get(3).x+random(-r, r), pincel.get(3).y+random(-r, r), 
  pincel.get(4).x+random(-r, r), pincel.get(4).y+random(-r, r), 
  pincel.get(5).x+random(-r, r), pincel.get(5).y+random(-r, r));
  endShape();
  if (t) {
    stroke(255, 150);
    triangle(pincel.get(0).x, pincel.get(0).y, pincel.get(3).x, pincel.get(3).y, 
    pincel.get(5).x, pincel.get(5).y);
  }  
  pincel.remove(0);
  pincel.add(new PVector(mouseX, mouseY, 0));
}

void drawOneDoodles() {
  stroke(255, 100);
  fill(100, 100);
  strokeWeight(4);
  ellipse(doodle.x, doodle.y, doodle.z, doodle.z);
  float r= doodle.z/2+10;
  //part.add(sin(r)*10,sin(r)*10, 0);
  doodle.add(random(-r/2, r/2), random(-r, r/3), 0);
  doodle.z*=0.93;
  if (doodle.z<10) {
    doodle.x=random(width);
    doodle.y=height/2+30;
    doodle.z=100;
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




// FUNCIONES DE TECLADO Y MOUSE

void keyPressed() {  
  if (key =='a' ) {
    slide++;
  } 
  if (key =='s' ) {
    slide--;
  }
  if (key=='d'&& (slide==25)) {
    for (int i =0;i<50;i++) {
      cursor(CROSS);
      balls.add(new PVector(mouseX+random(-100, 100), mouseY, random(160)));
      colors.add(new PVector(random(255), random(255), random(100, 255)));
      //ellipse(x, y, 10, 10);
    }
  }
}

void mouseMoved() {
  noFill();
  ellipse(mouseX, mouseY, 40, 40);
}

