
import SimpleOpenNI.*;
 
SimpleOpenNI  context;

PVector ball;
PVector jointPos_ProjR;
PVector jointPos_ProjL;
float rX,rY;
  
PImage manoR,manoL;

void setup()
{
  imageMode(CENTER);
  
  // inicia el kinnect
  context = new SimpleOpenNI(this);
  
  //cambiar dependiendo si el kinnect est'a en frente o atras
  context.setMirror(true);
 
  // mapa de profundidad
  context.enableDepth();
 
  // permite el rastreo de el esqueleto
  context.enableUser();
 
 jointPos_ProjR = new PVector();
 jointPos_ProjL = new PVector();
 
  background(0,0,0);
  stroke(255);
  strokeWeight(4);
  smooth();
  
 
  // tamano de la camara del kinnect
  size(displayWidth, displayHeight); 
  ball = new PVector(width/2,0);
  rX=width/context.depthWidth();
  rY=width/context.depthHeight();
  
  manoR = loadImage("MANO1.png");
  manoL = loadImage("MANO2.png");  
}

void draw()
{
  
  fill(255);
  ellipse(ball.x*rX,ball.y,20,20);
  // actualiza el cuadro
  context.update();
    background(100);
  // dibuja la imagen de profundidad
  //image(context.depthImage(),0,0); 
 
 //obtiene la lista de personas identificadas
 IntVector userList = new IntVector();
 context.getUsers(userList);
 
  // para todos los usuarios
  int i;
  for (i=1; i<=userList.size(); i++)
  {
    // check if the skeleton is being tracked
    if(userList.size()>0)
    {
      context.startTrackingSkeleton(i);//inicia el rastreo del esqueleto
      drawSkeleton(i);  // draw the skeleton
      println(i);
      if(dist(jointPos_ProjR.x,jointPos_ProjR.y,ball.x,ball.y)<100){
        ball.y-=50;
        
      }
    }
  }
  fill(255);
  ellipse(ball.x,ball.y,50,50);
  ball.y+=5;
  if(ball.y>height){
   ball.y=0; 
  }
}

// dibuja el esqueleto
void drawSkeleton(int userId)
{  
  //dibuja mano derecha
  PVector jointPosR = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_RIGHT_HAND,jointPosR);
  //convierte de milimetros a coordenadas de pantalla
  context.convertRealWorldToProjective(jointPosR,jointPos_ProjR);
  image(manoR,jointPos_ProjR.x*rX,jointPos_ProjR.y*rY);
  
  //ellipse(jointPos_ProjR.x,jointPos_ProjR.y,40,40);

  
  //DIbuja mano izquierda
  PVector jointPosL = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_LEFT_HAND,jointPosL);
  //convierte de milimetros a coordenadas de pantalla
  context.convertRealWorldToProjective(jointPosL,jointPos_ProjL);
  image(manoL,jointPos_ProjL.x*rX,jointPos_ProjL.y*rY);
  //ellipse(jointPos_ProjL.x,jointPos_ProjL.y,40,40);
  
}
