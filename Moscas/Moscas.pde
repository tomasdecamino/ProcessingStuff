//programado Tomas de Camino Beck

//taller pub interactiva
//arreglo de nBolas x 2 (con 2 coordenadas 0 es x y 1 es y)
int nBolas = 30;
float[][] bolas = new float[nBolas][4];
PImage imgMosca,imgMata, imgInsect;

void setup() {
  size(displayWidth, displayHeight);
  smooth();
  noCursor();
  //inicializa bolas al centro
  for (int i = 0; i<nBolas;i++) {
    bolas[i][0]=width/2;
    bolas[i][1]=height/2;
    bolas[i][2]=random(-2,2);
    bolas[i][3]=1;
  }
  ellipseMode(CENTER);
  imgMosca = loadImage("MOSCA2.png");
  imgMata = loadImage("SPLAT.png");
  imgInsect = loadImage("MATAMOSCAS.png");
  imageMode(CENTER);
}

void draw() {
  background(255);
  //dibuja el mouse
  fill(139);
  noStroke();
  image(imgInsect,mouseX,mouseY);
  fill(205, 200, 255, 119);
  //dibuja todas las bolas
  for (int i = 0; i<nBolas;i++) {
    if(bolas[i][3]>0){
    bolas[i][0]+=random(-10,10);
    bolas[i][1]-=random(-10,10);
    bolas[i][2]+=random(-0.01,0.01);
    pushMatrix();
    translate(bolas[i][0],bolas[i][1]);
   //rotate(random(-PI,PI));
    rotate(bolas[i][2]);
    image(imgMosca,0,0);
    popMatrix();
    //ellipse(bolas[i][0], bolas[i][1], 100, 100);
    if (sqrt(sq(mouseX-bolas[i][0])+sq(mouseY-bolas[i][1]))<200) {
      bolas[i][0]-=(mouseX-bolas[i][0])/(2+i);
      bolas[i][1]-=(mouseY-bolas[i][1])/(2+i);
    }
    }else{
         pushMatrix();
    translate(bolas[i][0],bolas[i][1]);
    image(imgMata,0,0);
    popMatrix(); 
    }
  }
}

void mouseReleased(){
   for (int i = 0; i<nBolas;i++) {
     if(dist(bolas[i][0],bolas[i][1],mouseX,mouseY)<100){
       bolas[i][3]=-1;
     } 
   }
}
