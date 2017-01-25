int n = 1000;

float[][] position=new float[n][2];

void setup() {
  size(displayWidth, displayHeight);//cambiar tamano de pantalla 
  background(255, 255, 255);
  for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
    position[bola][0]= random(0,width);
    position[bola][1]= random(0,height);
  }
  smooth(8);
}

void draw() {
 // background(255, 255, 255);
  stroke(0,100,255,10);
  strokeWeight(3);
  //noStroke();
  //fill(255, 0, 0,100);
  for (int bola=0;bola<n;bola++) {
    float r=random(5,300);
    position[bola][0]+=(mouseX-position[bola][0])/r;//X
    position[bola][1]+=(mouseY-position[bola][1])/r;//Y
    stroke(0,0,0,10);
    ellipse(position[bola][0],position[bola][1],10,10);
  }
   if (keyPressed) {
    saveFrame();
  }
}

