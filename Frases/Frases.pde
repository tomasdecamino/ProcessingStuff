PFrase[] frase1 = new PFrase[3];
PFrase[] frase2 = new PFrase[2];

PFont font;

int pt1x=400;
int pt1y=500;

int pt2x=140;
int pt2y=150;
int sp=50;


void setup() {
  //font = loadFont("AmericanTypewriter-50.vlw");
  font = createFont("HelveticaNeue-Light-48.vlw", 32);
  ;
  textSize(100);
  size(displayWidth, displayHeight);

  frase1[0] = new PFrase("Lo que conduce y arrastra al mundo", pt1x, pt1y, font);
  frase1[1] = new PFrase("no son la máquinas sino las ideas.", pt1x, pt1y+sp, font);
  frase1[2] = new PFrase("Víctor Hugo", pt1x, pt1y+2*sp, font);

  frase2[0] = new PFrase("La inspiración existe pero debe encontrarte trabajando", pt2x, pt2y, font);
  frase2[1] = new PFrase("Pablo Picasso", pt2x, pt2y+sp, font);
  rectMode(CENTER);
}


void draw() {
  frameRate(30);
  background(0, 0, 0);
  fill(255,0,0);
  ellipse(pt1x,pt1y+2*sp,100,100);
  ellipse(pt2x,pt2y+sp,100,100);
  smooth(8);
  strokeWeight(12);
  stroke(155, 100);
  fill(255, 110);
  if (!frase1[0].mode) {
    fill(255, 255);
  }
  for (int i=0; i<3;i++) {
    frase1[i].disperseOreturn();
   // frase1[i].checkAttractor(mouseX, mouseY, 200);
    frase1[i].checkAttractor(pt1x, pt1y+2*sp, 100);
    frase1[i].display();
  }
  fill(255, 150);
  if (!frase2[0].mode) {
    fill(255, 255);
  }
  for (int i=0; i<2;i++) {
    frase2[i].disperseOreturn();
    frase2[i].display();
   // frase2[i].checkAttractor(mouseX, mouseY, 100);
    frase2[i].checkAttractor(pt2x, pt2y+sp, 150);
  }
  //saveFrame("frames/####.tif");
  textAlign(CENTER);
}


void keyPressed() {

  if (key=='a') {
    frase1[0].setMode(false);
    frase1[1].setMode(false); 
    frase1[2].setMode(false); 
  } 
  else if (key == 's') {
    frase2[0].setMode(false);
    frase2[1].setMode(false);
  } 
  else if (key=='d'){
    frase1[0].setMode(false);
    frase1[1].setMode(false); 
    frase1[2].setMode(false); 
    frase2[0].setMode(false);
    frase2[1].setMode(false);
  }
}

void keyReleased() {
  frase1[0].setMode(true);
  frase1[0].randomSpeeds();
  frase1[1].setMode(true);
  frase1[1].randomSpeeds();
  frase1[2].setMode(true);
  frase1[2].randomSpeeds();

  frase2[0].setMode(true);
  frase2[0].randomSpeeds();
  frase2[1].setMode(true);
  frase2[1].randomSpeeds();
}

