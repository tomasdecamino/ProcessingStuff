PImage photo;
int x,y;

void setup() {
  background(255);
  photo = loadImage("tomas.bmp");
  size(photo.width, photo.height);
  x = width/2;
  y = height/2;
  image(photo, 0, 0);
  loadPixels();
  background(255);
}


void draw() {
  //background(255);
  noFill();
  smooth(8);
  strokeWeight(1);
  stroke(0, 10);
  if(random(1)>0.90){
    x = int(random(0,width));
    y = int(random(0,height));
  }
  int loc = x + y * width;
  //println(loc);
  stroke(pixels[loc], 80);
  //point(x*2,y*2);
  //loopPoint(x,y, 140, random(-3.14,3.14), random(0.5));
  arrow(x,y,int(random(40)),random(0,360));

}



void loopPoint(int x, int y, int l, float ang, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(ang);
  beginShape();
  curveVertex(0, 0); 
  curveVertex(0, 0);
  curveVertex(l, l);
  curveVertex(l, -l);    
  curveVertex(0, 0);
  curveVertex(0, 0);   
  endShape();
  popMatrix();
}

void keyPressed() {
  saveFrame();
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
