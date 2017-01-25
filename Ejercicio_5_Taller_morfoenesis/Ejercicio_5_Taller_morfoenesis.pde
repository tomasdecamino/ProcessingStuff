int n = 100;
PImage img;//declara una variable de tipo imagen
float[][] position=new float[n][2];

void setup() {
  size(displayWidth, displayHeight);//cambiar tamano de pantalla 
  background(255, 255, 255);
  for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
    position[bola][0]= random(0, width);
    position[bola][1]= random(0, height);
  }    
  img = loadImage("http://upload.wikimedia.org/wikipedia/commons/thumb/4/41/Wilber-huge-alpha.png/920px-Wilber-huge-alpha.png");//carga la imagen
  smooth(8);
  noCursor();
}

void draw() {
  // background(255, 255, 255);
  stroke(0, 100, 255, 50);
  strokeWeight(3);
  //noStroke();
  //fill(255, 0, 0,100);
  for (int bola=0;bola<n;bola++) {
    float r=random(100, 300);
    position[bola][0]+=(mouseX-position[bola][0])/r;//X
    position[bola][1]+=(mouseY-position[bola][1])/r;//Y
    stroke(0, 0, 0, 10);
    tint(255,100);//image transparente
    image(img, position[bola][0], position[bola][1],100,100);
    //ellipse(position[bola][0],position[bola][1],10,10);
  }
  //graba el cuadro cuando se presiona una tecla
  if (keyPressed) {
    saveFrame();
  }
  if (mousePressed) {
    background(255);
    for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
      position[bola][0]= random(0, width);
      position[bola][1]= random(0, height);
    }
  }
    if (keyPressed) {
    saveFrame();
  }
}

