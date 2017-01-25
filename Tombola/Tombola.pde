//@author Tomás de Camino Beck
//tomasdecamino.com

String[] code;
PFrase[] tombola;
PFont font;
int r;

void setup() {
  size(displayWidth, displayHeight);
  font = loadFont("AmericanTypewriter-64.vlw");
  //Data loaded from this file
  code = loadStrings("datos2.txt");
  tombola= new PFrase[code.length];
  for (int i=0; i<code.length;i++) {
    tombola[i]=new PFrase(code[i], width/2-500, height/2+50, font);
  }
  textSize(50);
  textAlign(CENTER);
}


void draw() {
  frameRate(30);
  background(255);
  fill(0, 60);
  //text(code[frameCount%code.length],width/2,height/2);
  for (int i=0; i<code.length;i++) {
    tombola[i].disperseOreturn();
    fill(255, 60);
    stroke(0, 100);
    if (i==r) {
      fill(0, 200);
      tombola[r].display(80);
    }
    tombola[i].checkAttractor(200, 200, 120);
    fill(0, 60);
    tombola[i].display(20);
  }
}

void keyPressed() {

  if (key=='d') {
    r=(int)random(code.length);
    tombola[r].setMode(false);
  } 
  if (key=='a') {
    for (int i=0; i<tombola.length;i++) {
      tombola[i].location.x=width/2-500; 
      tombola[i].location.y=height/2+50;
      tombola[r].setMode(true);
      tombola[r].randomSpeeds();
    }
  }
}

void keyReleased() {
  tombola[r].setMode(true);
  tombola[r].randomSpeeds();
}