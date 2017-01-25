
import SimpleOpenNI.*;
 
SimpleOpenNI  context;

void setup()
{
  // inicia el kinnect
  context = new SimpleOpenNI(this);
  
  //cambiar dependiendo si el kinnect est'a en frente o atras
  context.setMirror(true);
 
  // mapa de profundidad
  context.enableDepth();
 
  // permite el rastreo de el esqueleto
  context.enableUser();
 
  background(0,0,0);
  stroke(255);
  strokeWeight(4);
  smooth();
 
  // tamano de la camara del kinnect
  size(context.depthWidth(), context.depthHeight()); 
}

void draw()
{
  // actualiza el cuadro
  context.update();
  fill(0,10);
  rect(-10,-10,width+10,height+10);
  //  background(0);
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
    }
  }
}

// dibuja el esqueleto
void drawSkeleton(int userId)
{  
  //dibuja la cabeza
  PVector jointPos = new PVector();
  context.getJointPositionSkeleton(userId,SimpleOpenNI.SKEL_HEAD,jointPos);
  //convierte de milimetros a coordenadas de pantalla
  PVector jointPos_Proj = new PVector(); 
  context.convertRealWorldToProjective(jointPos,jointPos_Proj);
  ellipse(jointPos_Proj.x,jointPos_Proj.y,40,40);
  println(jointPos_Proj);
  
  
  context.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
 
  context.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
  context.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);  
}
