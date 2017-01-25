ArrayList<PVector> pincel = new ArrayList<PVector>();
ArrayList<PVector> pincel2 = new ArrayList<PVector>();

//number of images to load
PImage[] img = new PImage[21];


PFont font;
int slide=0;

int x, y;


int pt1x=750;
int pt1y=500;
int pt2x=300;
int pt2y=250;

float ang1=0;
float l1=0;
float ang2=0.3;
float l2=0;
float angE=0;

PVector point1;
PVector point2;

float ang=0;
float angInc=0.01;
int s=300;
int c=100;
int l=0;


void setup() {
  size(displayWidth, displayHeight);
  //setting fonts
  font = loadFont("Futura-CondensedExtraBold-204.vlw");
  textAlign(CENTER);

  //setup drawing lines
  pt1x=width/2+50;
  pt1y=height/2;
  pt2x=pt1x-100;
  pt2y=pt1y;
  point1  = new PVector(pt1x, pt1y, 0);
  point2  = new PVector(pt2x, pt2y, 0);  
  for (int i=0;i<7;i++) {
    pincel.add(new PVector(point1.x, point1.y, 0));
    pincel2.add(new PVector(point2.x, point2.y, 0));
  }
  x=height/2;
  y=0;

  //setting up images
  imageMode(CENTER);
  img[0]=loadImage("brain.png");
  img[1]=loadImage("hand.png");
  img[2]=loadImage("earth.png");
  img[3]=loadImage("sinclair.png");
  img[4]=loadImage("viola.png");
  img[5]=loadImage("automatanacion.jpg");
  img[6]=loadImage("teorema.jpg");
  img[7]=loadImage("facebook.png");
  img[8]=loadImage("manifiesto.jpg");
  img[9]=loadImage("alreves.jpg");
  img[10]=loadImage("lego.JPG");
  img[11]=loadImage("gemma.jpg"); 
  img[12]=loadImage("fablab1.jpg");
  img[13]=loadImage("fablab2.jpg");
  img[14]=loadImage("fablab3.jpg");
  img[15]=loadImage("maquinas2.jpg");
  img[16]=loadImage("maquinas1.jpg");
  img[17]=loadImage("quetzal.jpg");
  img[18]=loadImage("presi.jpg");
  img[19]=loadImage("pncti.png");
  img[20]=loadImage("automata.jpg");  
  smooth(8);
  noCursor();
}

void draw() {
  switch(slide) {
  case 0:
    background(0);
    //fill(0,100);
    //rect(-100,-100,width+100,height+100);
    textFont(font, 180); 
    fill(255);
    text("Hackear", width/2+random(-1, 1), height/2+random(-1, 1));
    text("Para Innovar", width/2+random(-1, 1), 180+height/2+random(-1, 1));
   // text("de Polímatas", width/2+random(-1, 1), height/2+random(-1, 1));
   // text("y Artífices", width/2+random(-1, 1), 180+height/2+random(-1, 1));
    break;
  case 1:
    background(255);
    fill(255);
    noStroke();
    rect(0, 0, width, height/2);
    fill(0);
    rect(0, height/2, width, height);
    slide++;
    break;   
  case 2:
    //background(255);
    //brain
    pushMatrix();
    translate(random(width), random(0, height/2));
    scale(0.5);
    rotate(random(PI));
    tint(0, 127); 
    image(img[0], 0, 0);
    popMatrix();
    fill(255);
    text("Cerebro", width/2, height/2-100);
    //hand
    pushMatrix();
    translate(random(width), random(height/2, height));
    scale(0.2);
    rotate(random(PI));
    tint(255, 127); 
    image(img[1], 0, 0);
    popMatrix();
    fill(0);
    text("Manos", width/2, height/2+200);    
    break; 
  case 3:
    background(255);
    //fill(0,100);
    //rect(-100,-100,width+100,height+100);
    // filter(INVERT);
    tint(0, 255); 
    pushMatrix();
    translate(width/2, height/2);
    rotate(PI+random(-0.1, 0.1));
    image(img[2], 0, 0);
    popMatrix();
    break;
  case 4:
    background(0);
    textFont(font, 124); 
    fill(255);
    text("¿Motivación?", width/2, height/2-50);
    textFont(font, 44);
    text("(basta de charlas motivadoras)", width/2, height/2+50);
    break; 
  case 5:
    background(0);
    textFont(font, 204); 
    fill(255);
    text("Cómo", width/2, height/2);
    text("¿         ?", width/2+random(-2, 2), height/2+random(-2, 2));
    break;    
  case 6:
    background(255);
    slide++;
    break;
  case 7:
    //background(255);
    fill(255, 30);
    rect(-100, -100, width+100, height+100);
    textFont(font, 180); 
    fill(0, 200);
    pushMatrix();
    translate(width/2-50, height/2);
    rotate(angE);
    text("E           ", 0, 0);
    popMatrix();
    fill(0, 200);
    text("    ducación", width/2-50, height/2);
    angE+=0.02;
    break;
  case 8:
    background(255);
    textFont(font, 110); 
    fill(0);
    pushMatrix();
    translate(width/2, height/2);
    scale(sin(frameCount/2%10));
    text("Nuevas Generaciones", 0, 0);
    popMatrix();
    break; 
  case 9:
    // background(255);
    fill(0, 50);
    rect(-100, -100, width+100, height+100);
    textFont(font, 120); 
    fill(#1271E3, 200);
    pushMatrix();
    translate(width/2, height/2);
    text("Mujer", -200+frameCount%400, 0);
    fill(#6FE312, 150);
    text("Hombre", 200-frameCount%400, 0);
    popMatrix();
    break;
  case 10:
    background(255);
    textFont(font, 124); 
    fill(random(255), random(255), random(255), 250);
    text("Emprendimiento", width/2, height/2);
    break;   
  case 11:
    background(255);
    slide++;
    break;  
  case 12:
    fill(0, 200);
    textFont(font, 200);
    if (frameCount%5==0) {
      text("Creatividad", width/2, height/2);
    }
    fill(255, 200);
    strokeWeight(5);
    stroke(0, 150);
    drawCircles(random(width), random(height), 5, (int)random(15, 45));
    break;  
  case 13:
    background(0);
    slide++;
    break;
  case 14:
    //background(0);
    //fill(0,100);
    //rect(-100,-100,width+100,height+100);
    textFont(font, 230); 
    fill(random(255));
    text("Innovación", width/2, y);
    if (y<height-300) {
      y+=1;
    }
    break; 
  case 15:
    background(0);
    textFont(font, 164); 
    fill(255);
    text("1.", width/2, height/2-50);
    textFont(font, 64);
    text("Polímata", width/2, height/2+50);
    break;      
  case 16:
    fill(0);
    noStroke();
    rect(width/2, 0, width, height);
    fill(255);
    rect(0, 0, width/2, height);
    slide+=1;
    break;
  case 17:
    //background(255);
    strokeWeight(1);
    textSize(10);
    drawShape1();
    drawShape2();
    break;
  case 18:
    fill(0);
    noStroke();
    rect(width/2, 0, width, height);
    fill(255);
    rect(0, 0, width/2, height);
    point1.x=width/2;
    point1.y=height/2;
    for (int i=0;i<7;i++) {
      pincel.remove(0);
    }
    for (int i=0;i<7;i++) {
      pincel.add(new PVector(width/2, height/2, 0));
    }
    slide+=1;
    break;
  case 19:
    //background(255);
    strokeWeight(1);
    drawShape3();
    break;
  case 20:
    background(0);
    textFont(font, 64); 
    fill(255);
    text("Momentos de creatividad", width/2, height/2-50);
    textFont(font, 54);
    text("cerebro es uno", width/2, height/2);
    textFont(font, 44);
    text("(Mark Beeman)", width/2, height/2+100);    
    break;     
  case 21:
    background(0);
    tint(255, 255);
    image(img[3], width/2, height/2);
    break; 
  case 22:
    background(0);
    image(img[4], width/2, height/2);
    break;
  case 23:
    background(0);
    image(img[20], width/2, height/2);
    break;
  case 24:
    background(0);
    image(img[5], width/2, height/2);
    break;  
  case 25:
    background(0);
    image(img[6], width/2, height/2);
    break;
  case 26:
    background(255);
    slide++;
    break;
  case 27:
    generativeArt1();
    break;
  case 28:
    background(255);
    fill(0);
    drawPythagoras(width/2-100, height-200, 150, 8);
    break;
  case 29:
    background(0);
    textFont(font, 64); 
    fill(255);
    text("Polimatía", width/2, height/2-100);
    textFont(font, 54);
    text("Estado", width/2, height/2-50);
    textFont(font, 124);
    text("Mental", width/2, height/2+100);    
    break;
  case 30:
    background(0);
    image(img[7], width/2, height/2);
    break;
  case 31:
    background(0);
    textFont(font, 64); 
    fill(255);
    text("Polimatía", width/2, height/2-100);
    textFont(font, 54);
    text("Estado", width/2, height/2-50);
    textFont(font, 124);
    text("Mental", width/2+random(-3, 3), height/2+100+random(-3, 3));    
    break; 
  case 32:
    background(0);
    image(img[8], width/2, height/2);
    break;
  case 33:
    background(0);
    image(img[9], width/2, height/2);
    break;
  case 34:
    background(0);
    textFont(font, 164); 
    fill(255);
    text("2.", width/2, height/2-50);
    textFont(font, 64);
    text("Artífice", width/2, height/2+50);
    break;
  case 35:
    pushMatrix();
    translate(random(width), random(0, height));
    scale(0.2);
    rotate(random(PI));
    tint(255, 127); 
    image(img[1], 0, 0);
    popMatrix();
    break;
  case 36:
    background(0);
    tint(255, 255); 
    image(img[10], width/2, height/2);
    break;
  case 37:
    background(0);
    tint(255, 255);
    slide++; 
    //image(img[11], width/2, height/2);
    break;    
  case 38:
    background(0);
    textFont(font, 164); 
    fill(255);
    text("FabLab", width/2, height/2-50);
    textFont(font, 64);
    text("Laboratorio de Fabricación", width/2, height/2+50);
    break;
  case 39:
    background(0);
    tint(255, 255); 
    image(img[12], width/2, height/2);
    break; 
  case 40:
    background(0);
    tint(255, 255); 
    image(img[13], width/2, height/2);
    break;
  case 41:
    background(0);
    tint(255, 255); 
    image(img[14], width/2, height/2);
    break;
  case 42:
    background(0);
    tint(255, 255); 
    image(img[15], width/2, height/2);
    break; 
  case 43:
    background(0);
    tint(255, 255);
    image(img[16], width/2, height/2);
    break;
  case 44:
    background(0);
    textFont(font, 164); 
    fill(255);
    text("FabLab", width/2, height/2-50);
    textFont(font, 64);
    text("Lenguaje Universal", width/2, height/2+50);
    break;
  case 45:
    background(0);
    textFont(font, 164); 
    fill(255);
    text("FabLab", width/2, height/2-50);
    textFont(font, 64);
    text("Ciencia/Tecnología y Arte", width/2, height/2+50);
    break; 
  case 46:
    background(0);
    textFont(font, 164); 
    fill(255);
    text("FabLab", width/2, height/2-50);
    textFont(font, 64);
    text("Ciencia/Tecnología con ciudadan@", width/2, height/2+50);
    break; 
  case 47:
    background(0);
    textFont(font, 64); 
    fill(255);
    text("Artífice", width/2, height/2-50);
    textFont(font, 124);
    text("Actitud", width/2, height/2+50);
    break;
  case 48:
    background(0);
    textFont(font, 64); 
    fill(255);
    text("Artífice", width/2, height/2-50);
    textFont(font, 134);
    fill(random(255), random(255), random(255));
    text("Hacker", width/2, height/2+50);
    break;
  case 49:
    background(0);
    tint(255, 255); 
    image(img[17], width/2, height/2);
    break; 
  case 50:
    background(0);
    tint(255, 255); 
    image(img[18], width/2, height/2);
    break;
  case 51:
    background(0);
    tint(255, 255); 
    image(img[19], width/2, height/2);
    break; 
  case 52:
    //background(255);
    fill(255, 30);
    rect(-100, -100, width+100, height+100);
    textFont(font, 180); 
    fill(0, 200);
    pushMatrix();
    translate(width/2-50, height/2);
    rotate(angE);
    text("E           ", 0, 0);
    popMatrix();
    fill(0, 200);
    text("    ducación", width/2-50, height/2);
    angE+=0.02;
    break;
  case 53:
    background(255);
    textFont(font, 110); 
    fill(0);
    pushMatrix();
    translate(width/2, height/2);
    scale(sin(frameCount/2%10));
    text("Nuevas Generaciones", 0, 0);
    popMatrix();
    break; 
  case 54:
    // background(255);
    fill(0, 50);
    rect(-100, -100, width+100, height+100);
    textFont(font, 120); 
    fill(#1271E3, 200);
    pushMatrix();
    translate(width/2, height/2);
    text("Mujer", -200+frameCount%400, 0);
    fill(#6FE312, 150);
    text("Hombre", 200-frameCount%400, 0);
    popMatrix();
    break;
  case 55:
    background(255);
    textFont(font, 124); 
    fill(random(255), random(255), random(255), 250);
    text("Emprendimiento", width/2, height/2);
    break;   
  case 56:
    background(255);
    slide++;
    break;  
  case 57:
    fill(0, 200);
    textFont(font, 200);
    if (frameCount%5==0) {
      text("Creatividad", width/2, height/2);
    }
    fill(255, 200);
    strokeWeight(5);
    stroke(0, 150);
    drawCircles(random(width), random(height), 5, (int)random(15, 45));
    break;  
  case 58:
    background(0);
    slide++;
    break;
  case 59:
    //background(0);
    //fill(0,100);
    //rect(-100,-100,width+100,height+100);
    textFont(font, 230); 
    fill(random(255));
    text("Innovación", width/2, y);
    if (y<height-300) {
      y+=1;
    }
    break; 
  case 60:
    background(0);
    //fill(0,100);
    //rect(-100,-100,width+100,height+100);
    textFont(font, 180); 
    fill(255);
    text("de Polímatas", width/2+random(-1, 1), height/2+random(-1, 1));
    text("y Artífices", width/2+random(-1, 1), 180+height/2+random(-1, 1));
    break; 
  case 61:
    exit();
  }
}

/******** FUNCIONES *******************/

void drawShape1() {
  fill(random(255), random(255), random(255), 150);
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
  int r = 100;
  beginShape();
  stroke(255);
  //fill(255);
  //text((int)pincel.get(2).x,pincel.get(2).x,pincel.get(2).y);
  //text((int)pincel.get(2).y,pincel.get(2).x+30,pincel.get(2).y);
  vertex(pincel.get(2).x, pincel.get(2).y);
  bezierVertex(pincel.get(3).x+random(-r, r), pincel.get(3).y+random(-r, r), 
  pincel.get(4).x+random(-r, r), pincel.get(4).y+random(-r, r), 
  pincel.get(5).x+random(-r, r), pincel.get(5).y+random(-r, r));
  endShape();

  pincel.remove(0);
  pincel.add(new PVector(point1.x, point1.y, 0));
  point1.add(random(0, 1), random(-20, 20), 0);
}

void drawShape2() {
  fill(0, 50);
  stroke(0);
  beginShape();
  vertex(pincel2.get(0).x, pincel2.get(0).y);
  bezierVertex(pincel2.get(1).x, pincel2.get(1).y, 
  pincel2.get(2).x, pincel2.get(2).y, 
  pincel2.get(3).x, pincel2.get(3).y);
  bezierVertex(pincel2.get(4).x, pincel2.get(4).y, 
  pincel2.get(5).x, pincel2.get(5).y, 
  pincel2.get(6).x, pincel2.get(6).y);
  endShape();
  int r = 10;
  beginShape();
  stroke(255, 100);
  //fill(255);
  text((int)pincel2.get(2).x-300, pincel2.get(2).x, pincel2.get(2).y);
  //text((int)pincel.get(2).y,pincel.get(2).x+30,pincel.get(2).y);
  vertex(pincel2.get(2).x, pincel2.get(2).y);
  bezierVertex(pincel2.get(3).x, pincel2.get(3).y, 
  pincel2.get(4).x+random(-r, r), pincel2.get(4).y+random(-r, r), 
  pincel2.get(5).x+random(-r, r), pincel2.get(5).y+random(-r, r));
  endShape();

  pincel2.remove(0);
  pincel2.add(new PVector(point2.x, point2.y, 0));
  point2.add(random(-1, 0), random(-10, 10), 0);
}

void drawShape3() {
  fill(random(255), random(255), random(255), 150);
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
  int r = 100;
  beginShape();
  stroke(255);
  //fill(255);
  //text((int)pincel.get(2).x,pincel.get(2).x,pincel.get(2).y);
  //text((int)pincel.get(2).y,pincel.get(2).x+30,pincel.get(2).y);
  vertex(pincel.get(2).x, pincel.get(2).y);
  bezierVertex(pincel.get(3).x+random(-r, r), pincel.get(3).y+random(-r, r), 
  pincel.get(4).x+random(-r, r), pincel.get(4).y+random(-r, r), 
  pincel.get(5).x+random(-r, r), pincel.get(5).y+random(-r, r));
  endShape();

  pincel.remove(0);
  pincel.add(new PVector(point1.x, point1.y, 0));
  ang1+=0.1;
  l1+=0.1;
  point1.add(l1*sin(ang1), l1*cos(ang1), 0);
}

void generativeArt1() {
  fill(255, 10);
  stroke(0, 100);
  pushMatrix();
  translate(width/2+sin(ang), height/2+cos(ang)-200);
  rotate(ang);
  rect(c, c, s*sin(ang), s*cos(ang), 20);
  ang+=angInc;
  popMatrix();
}


void drawCircles(float x, float y, int n, int b) {
  for (int i=n;i>0;i--) {
    ellipse(x, y-(i%2*n/2), b*i, b*i);
  }
}

void arrow(int x, int y, int l, float ang) {
  //para determinar el largo de la punta en 45 grados
  int arrowLength = 50;
  pushMatrix();
  //cambia el eje del dibujo y lo rota
  translate(x, y);
  rotate(radians(ang));
  //dibuja una linea y flecha en el eje X
  line(0, 0, l, 0);
  line(l, 0, l - arrowLength, -arrowLength);
  line(l, 0, l - arrowLength, arrowLength);
  popMatrix();
}

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
    float a = h/2;//map(mouseX, 0, width, 0, h);
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


void keyPressed() {  
  if (keyCode ==DOWN ) {
    slide++;
  } 
  if (keyCode ==UP ) {
    slide--;
  }
  if (keyCode == ALT) {
    saveFrame("frames/####.jpg");
  }
}

