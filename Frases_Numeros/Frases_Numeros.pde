PFrase[] frase1 = new PFrase[5];
PFrase[] frase2 = new PFrase[2];

PFont font;

void setup(){
  //font = loadFont("AmericanTypewriter-50.vlw");
  font = createFont("Times", 32);;
  textSize(100);
  size(displayWidth, displayHeight);
  
  frase1[0] = new PFrase("2 3 5 7 9 11 13 17 19",140,250,font);
  frase1[1] = new PFrase("23 29 31 37 41 43 47",140,300,font);
  frase1[2] = new PFrase("73 79 83 89 97 101",140,350,font);
  frase1[3] = new PFrase("179 181 191 193 197 199 211",140,400,font);
  frase1[4] = new PFrase("947 953 569 571",140,450,font); 
  
  
  frase2[0] = new PFrase("01001010100101010010101010010101001",400,400,font);
  frase2[1] = new PFrase("0101010010101001001010010101010010101",400,450,font);
  rectMode(CENTER);
}


void draw(){
  frameRate(30);
  background(0,0,0);
  //fill(0,30);
  //rect(0,0,width,height);
  smooth(8);
  strokeWeight(12);
  stroke(155,100);
  fill(255,110);
  if(!frase1[0].mode){
    fill(255,255);
  }
  for(int i=0; i<5;i++){
    frase1[i].disperseOreturn();
    frase1[i].checkAttractor(mouseX,mouseY,200);
    frase1[i].checkAttractor(400,600,100);
    frase1[i].display();
  }
  fill(255,150);
  if(!frase2[0].mode){
    fill(255,255);
  }
    for(int i=0; i<2;i++){
    frase2[i].disperseOreturn();
    frase2[i].display();
    frase2[i].checkAttractor(mouseX,mouseY,100);
    frase2[i].checkAttractor(400,600,150);
  }
  //saveFrame("frames/####.tif");
  textAlign(CENTER);
  
}


void keyPressed() {

  if(key=='a'){
    frase1[0].setMode(false);
    frase1[1].setMode(false); 
    frase1[2].setMode(false); 
    frase1[3].setMode(false);
    frase1[4].setMode(false);  
  } else if(key == 's'){
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
    frase1[3].setMode(true);
    frase1[3].randomSpeeds();
    frase1[4].setMode(true);
    frase1[4].randomSpeeds();
    
    frase2[0].setMode(true);
    frase2[0].randomSpeeds();
    frase2[1].setMode(true);
    frase2[1].randomSpeeds();
}
