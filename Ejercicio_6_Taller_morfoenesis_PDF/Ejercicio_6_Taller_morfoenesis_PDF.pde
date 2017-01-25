import processing.pdf.*;

int n = 500;
int x, y;

float[][] position=new float[n][2];

void setup() {
  size(displayWidth, displayHeight, PDF, "TomasDesign.pdf");//cambiar tamano de pantalla 
  background(255, 255, 255);
  for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
    position[bola][0]= random(0, width);
    position[bola][1]= random(0, height);
  }
  smooth(8);
  x=348;
  y=299;
}

void draw() {
  //background(255, 255, 255);
  stroke(0, 100, 255, 100);
  strokeWeight(1);
  //noStroke();
  //fill(255, 0, 0,100);
  for (int bola=0;bola<n;bola++) {
    float r=50;//random(5, 300);
    position[bola][0]+=(x-position[bola][0])/r;//X
    position[bola][1]+=(y-position[bola][1])/r;//Y
    for (int j=0;j<n;j++) {
      //calcula la distancia de bola a j
      float d=dist(position[bola][0], position[bola][1], position[j][0], position[j][1]);
      //si la otra boal esta a menos de 10 pixeles y no es ella misma
      if (d<30 && bola!=j) {
        line(position[bola][0], position[bola][1], position[j][0], position[j][1]);
        position[bola][0]+=(position[bola][0]-position[j][0])/500;
        position[bola][1]+=(position[bola][1]-position[j][1])/500;
        //position[bola][0]+=1/abs(position[bola][0]-position[j][0]);
        //position[bola][1]+=1/abs(position[bola][1]-position[j][1]);
      }
    }
    stroke(0, 0, 0, 100);
    ellipse(position[bola][0], position[bola][1], 15, 15);
  }
  if (keyPressed) {
    saveFrame();
  }
  if (mousePressed) {
    print(mouseX);
    print(",");
    print(mouseY);
    print(",");
    println(frameCount);
  }
  if (frameCount==70) {
    x=299;
    y=234;
  }
  if (frameCount==87) {
    x=252;
    y=296;
  }
  if (frameCount==156) {
    x=359;
    y=308;
  }
  if (frameCount==179) {
    x=190;
    y=228;
  }
  if (frameCount==247) {
    x=118;
    y=234;
  }
  if (frameCount==250) {
    exit();
  }    
}

