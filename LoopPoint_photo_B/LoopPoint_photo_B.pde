PImage photo;
int x,y;

void setup() {
  background(255);
  x = width/2;
  y = height/2;
  photo = loadImage("muriel.jpg");
  size(photo.width, photo.height);
  image(photo, 0, 0);
  loadPixels();
  background(0);
}


void draw() {
  //background(255);
  noFill();
  smooth(8);
  strokeWeight(2);
  stroke(0, 10);
  if(random(1)>0.90){
    x = int(random(0,width));
    y = int(random(0,height));
  }
  int loc = x + y * width;
  //println(loc);
  stroke(pixels[loc], 80);
  arrow(x,y,int(random(240)),random(0,360));

}

void arrow(int x, int y, int l, float ang){
  //para determinar el largo de la punta en 45 grados
  int arrowLength = 8;
  pushMatrix();
  //cambia el eje del dibujo y lo rota
  translate(x, y);
  rotate(radians(ang));
  //dibuja una linea y flecha en el eje X
  line(0,0,l, 0);
  line(l, 0, l - arrowLength, -arrowLength);
  line(l, 0, l - arrowLength, arrowLength);
  popMatrix();
}


