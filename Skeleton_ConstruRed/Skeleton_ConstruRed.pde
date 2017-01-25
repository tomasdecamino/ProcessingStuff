String file="";
import SimpleOpenNI.*;

SimpleOpenNI  context;
PrintWriter output;

void setup()
{

  //selectOutput("Select a folder to process:", "fileSelected"); 
  //while(file=="");  
  
  // inicia el kinnect
  context = new SimpleOpenNI(this);

  //cambiar dependiendo si el kinnect est'a en frente o atras
  context.setMirror(true);

  // mapa de profundidad
  context.enableDepth();

  // permite el rastreo de el esqueleto
  context.enableUser();

  background(0, 0, 0);
  stroke(255);
  strokeWeight(4);
  //smooth();

  // tamano de la camara del kinnect
  size(context.depthWidth(), context.depthHeight());
  output = createWriter("nombreArchivo.txt");
  output.println("MILLIS,HEAD,NECK,LEFT_S,RIGHT_S,TORSO,LEFT_HIP,RIGHT_HIP,SKEL_LEFT_ELBOW,SKEL_RIGHT_ELBOW,SKEL_LEFT_HAND,SKEL_RIGHT_HAND,SKEL_LEFT_KNEE,SKEL_RIGHT_KNEE,SKEL_LEFT_FOOT,SKEL_RIGHT_FOOT");
}

void fileSelected(File selection) {
  file = selection.getAbsolutePath();
}

void draw()
{
  // actualiza el cuadro
  context.update();
  background(0);
  image(context.depthImage(),0,0);
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
    if (userList.size()>0)
    {
      context.startTrackingSkeleton(i);//inicia el rastreo del esqueleto
      drawSkeleton(i);  // draw the skeleton
      println(i);
    }
  }
  saveFrame("frames/####.jpg");
}

// dibuja el esqueleto
void drawSkeleton(int userId)
{  
  PVector jointPos = new PVector();
  //Get joint positions and save them, first save the time;
  output.print(millis());
  output.print(',');
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_HEAD, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_NECK, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_TORSO, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HIP, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HIP, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_KNEE, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_FOOT, jointPos);
  saveVector(jointPos);
  context.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_FOOT, jointPos);
  saveVector(jointPos);  
  
  output.println("");

  //Draw skeleton;
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

void keyPressed() {
  output.flush();  
  output.close();  
  exit();
}

void saveVector(PVector pos) {
  output.print(pos.x);
  output.print(',');  
  output.print(pos.y); 
  output.print(',');   
  output.print(pos.z);
  output.print(','); 
}

