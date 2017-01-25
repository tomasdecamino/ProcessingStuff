void setup() {
  //tamano del canvas y definicin para 3D
  size(displayWidth, displayHeight, P3D);
  //algoritmo de suavizado
  smooth();
}

void draw() {
  background(0);
  //funcion drawEye, posixion x, posicion y, radio, rotacion x, rotacion y
 drawEye(width/2, height/2+75, 46, mouseX, mouseY);


}


/*************************************************/

/*************FUNCIONES**************************/

void drawEye(int x, int y, float r, float rotX, float rotY){
  lights();
  //spotLight(255, 255, 255, width/2, height/2, 400, 0, 0, -10, PI/4, 2);
  sphereDetail(100);
  pushMatrix();
  translate(x, y, 0);
  //maps mouse to rotation
  rotateY(map(rotX,0,width,-HALF_PI,HALF_PI));
  rotateX(map(rotY,0,height,HALF_PI,-HALF_PI));
  fill(243,237,205);
  noStroke();
  
  sphere(r);
    pushMatrix();
     translate(0, 0, 10+r/2);
     fill(255,0,102);
     sphere(r/2);
    popMatrix();
  popMatrix(); 
}

