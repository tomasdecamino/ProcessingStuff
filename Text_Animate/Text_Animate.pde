PFont font;
int slide=0;

void setup() {
  size(displayWidth, displayHeight);
  font = loadFont("Futura-CondensedExtraBold-204.vlw");
  smooth();
}

void draw() {
  switch(slide) {
  case 0:
    background(0);
    //fill(0,100);
    //rect(-100,-100,width+100,height+100);
    textFont(font, 180); 
    fill(255);
    text("de Polímatas", 10+random(-1, 1), height/2+random(-1, 1));
    text("y Artífices", 10+random(-1, 1), 180+height/2+random(-1, 1));
    break;
  case 1:
    background(255);
    break;
  }
}

void keyPressed() {  
  if (keyCode ==DOWN ) {
    slide++;
  } 
  if (keyCode ==UP ) {
    slide--;
  }
}

