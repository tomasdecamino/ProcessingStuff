//Generative Design Prueba 2
//parasitoide hospedero
//Tomas de Camino Beck

float c =3; 
float a = 0.005;
float r = 1.05; 
float k=200;

void setup() {
  background(255);
  size(400, 400);
}

void draw() {
  fill(0,10);
  //background(0);
 // rect(-1,-1,width,height);
  smooth(8);
  strokeWeight(1);
  stroke(80,40);
  drawHP(mouseX,mouseY,0.5,1);
}

void drawHP(int x, int y, float ang, float dim) {
  float h0=x, p0=y, h1=0,p1=0;
  pushMatrix();
  translate(x, y);
  scale(dim);
  rotate(ang);
  for (int i = 0; i<200;i++) {
    h1 = h0 * exp(-a * p0)* exp(r*(1-h0/k));
    p1= c*h0*(1-exp(-a*p0));
    if(i>20){
    line(h0, p0, h1, p1);
    }
    h0=h1;
    p0=p1;
  }
  popMatrix();
}  

void keyPressed() {
  background(255);

}
