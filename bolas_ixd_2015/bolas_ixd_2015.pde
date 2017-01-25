int bolas = 50;
float[] posX = new float[bolas];
float[] posY = new float[bolas];

float[] velX = new float[bolas];
float[] velY = new float[bolas];


void setup() {
  size(displayWidth, displayHeight);
  //bola 1
  for (int i=0;i<bolas;i++) {
    posX[i]= random(width);
    posY[i]= random(height);
    velX[i] =random(-3, 3);
    velY[i]=random(-3, 3);  
    smooth(8);
  }
}

void draw() {
  background(255);
  fill(#509AD6, 100);
  //bola1  
  for (int i=0;i<bolas;i++) {
    ellipse(posX[i], posY[i], 100, 100);
    posX[i]+=velX[i];
    posY[i]+=velY[i];
    velX[i]+=0.1;
    velY[i]+=0.1;
    //check edges
    if (posX[i]>width || posX[i]<0)velX[i]*=-1;
    if (posY[i]>height || posY[i]<0) velY[i]*=-1;
  }
}

