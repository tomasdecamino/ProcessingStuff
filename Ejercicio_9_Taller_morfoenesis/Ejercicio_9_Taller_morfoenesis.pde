int n = 50;

float[][] position=new float[n][6];

void setup() {
  size(displayWidth, displayHeight);//cambiar tamano de pantalla 
  background(0, 0, 0);
  for (int bola=0;bola<n;bola++) {//colocar bolas en el centro
    position[bola][0]= random(0, width);
    position[bola][1]= random(0, height);
    position[bola][2]=random(-PI,PI);//para almacenar angulo
    //colores RGB
    position[bola][3]=random(255);
    position[bola][4]=random(255);
    position[bola][5]=random(255);
  }
  smooth(8);
  rectMode(CENTER);//dibuje un rectangulo desde el centro
}

void draw() {
  background(255, 255, 255);
  strokeWeight(1);
  //noStroke();
  noFill();
  fill(255, 255, 255,100);
  for (int bola=0;bola<n;bola++) {
    float r=50;//random(5, 300);
    position[bola][0]+=(mouseX-position[bola][0])/r;//X
    position[bola][1]+=(mouseY-position[bola][1])/r;//Y
    position[bola][2]+=1;
    for (int j=0;j<n;j++) {
      //calcula la distancia de bola a j
      float d=dist(position[bola][0],position[bola][1],position[j][0],position[j][1]);
      //si la otra boal esta a menos de 10 pixeles y no es ella misma
      stroke(position[bola][3],position[bola][4],position[bola][5], 100);
      if(d<50 && bola!=j){
        line(position[bola][0],position[bola][1],position[j][0],position[j][1]);
        position[bola][0]+=(position[bola][0]-position[j][0])/5;
        position[bola][1]+=(position[bola][1]-position[j][1])/5;
       //position[bola][0]+=1/abs(position[bola][0]-position[j][0]);
       //position[bola][1]+=1/abs(position[bola][1]-position[j][1]);
      }
    }
    stroke(position[bola][3],position[bola][4],position[bola][5], 200);
    //fill(position[bola][3],position[bola][4],position[bola][5],200);
    //Nuevo marco de referencia
    pushMatrix();
    translate(position[bola][0],position[bola][1]);
    rotate(position[bola][2]);
    scale(1);
    rect(0,0, 30, 30);
    popMatrix();
  }
    if (keyPressed) {
    saveFrame();
  }
}

