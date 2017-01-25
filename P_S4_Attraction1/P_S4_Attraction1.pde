//Tomas de Camino
//Usa libreria ControlP5 util para interfaz
import controlP5.*;
ControlP5 cp5;

//particle parameters
int n = 100;
int area=73; 
int repulsion;
int bots=2;

//particle position array
float[][] position=new float[n][2];

void setup() {
  size(600, 600);//cambiar tamano de pantalla 
  background(255);
  for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
    position[bola][0]= random(0, width);
    position[bola][1]= random(0, height);
  }
  smooth(8);
/*******ControlP5 settings ***********/
  cp5 = new ControlP5(this);
  //slider for repultion
  cp5.addSlider("repulsion")
    .setPosition(5, 5)
      .setRange(10, 200)
        .setColorCaptionLabel(0)
          ;

  //slider for area
  cp5.addSlider("area")
    .setPosition(5, 20)
      .setRange(5, 300)
        .setColorCaptionLabel(0)
          ;

  cp5.addSlider("bots")
    .setPosition(5, 40)
      .setRange(2, n)
        .setColorCaptionLabel(0)
          ;
          
/********/
}

void draw() {
  background(255);
  //stroke(0, 100, 255, 100);
  strokeWeight(2);
  //noStroke();
  //fill(255, 0, 0,100);
  for (int bola=0;bola<bots;bola++) {
    float r=50;//random(5, 300);
    for (int j=0;j<bots;j++) {
      //calcula la distancia de bola a j
      float d=dist(position[bola][0], position[bola][1], position[j][0], position[j][1]);
      //si la otra boal esta a menos de 10 pixeles y no es ella misma
      if (d<area && bola!=j) {
        stroke(205,51,51, 50);
        line(position[bola][0], position[bola][1], position[j][0], position[j][1]);
        position[bola][0]+=(position[bola][0]-position[j][0])/repulsion;
        position[bola][1]+=(position[bola][1]-position[j][1])/repulsion;
      }
      else {
        if (bola!=j) {
          position[bola][0]+=(position[j][0]-position[bola][0])/500;//X
          position[bola][1]+=(position[j][1]-position[bola][1])/500;//Y
        }
      }
    }
    stroke(0, 100);
    ellipse(position[bola][0], position[bola][1], 40, 40);
  }
  if (keyPressed) {
    for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
      position[bola][0]= random(0, width);
      position[bola][1]= random(0, height);
    }
  }
}