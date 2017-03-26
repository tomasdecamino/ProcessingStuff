//@author: Tomas de Camino Beck
//Conjunto de pares ordenados x,y
//del conjunto x^2+y^2=r

float a=0;

void setup() {
  size(800, 800);
  background(0);
}

void draw() {
  int r=200;
  stroke(255,50);
  strokeWeight(20);
  a=map(mouseX, 0, width, 0, TWO_PI);
  //plano de referencia cambia
  pushMatrix();
  translate(width/2,height/2);
  //calcular puntos x,y donde x^2+y^2=r
  float x = cos(a)*r;
  float y = sin(a)*r;
  //dibuja punto
  point(x,y);
  strokeWeight(2);
  //dibuja linea
  line(0,0,x,y);
  popMatrix();
}