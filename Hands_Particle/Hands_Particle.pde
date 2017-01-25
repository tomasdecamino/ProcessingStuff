import SimpleOpenNI.*;

int gridSize =30;//size of the grid
gridPoint[][] grid = new gridPoint[gridSize][gridSize];
float sizeFactorX,sizeFactorY;

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

  background(255);

  smooth();

  //PVector joint = new PVector();
  // tamano de la camara del kinnect
  size(displayWidth, displayHeight);
  sizeFactorX=width/context.depthWidth();
  sizeFactorY=height/context.depthHeight();
  for (int i = 0; i<gridSize;i++) {
    for (int j = 0; j<gridSize;j++) {
      //uncomment for regular grid
      grid[i][j] = new gridPoint(i*width/gridSize, j*height/gridSize);
      //println(grid[i][j].position);
      //uncomment for random grid
      //grid[i][j] = new gridPoint(random(width), random(height));
    }
  }

}

void draw()
{
  //saveFrame();
  // actualiza el cuadro
  context.update();
  //background(255);
  // dibuja la imagen de profundidad
  //image(context.depthImage(),0,0); 

  //obtiene la lista de personas identificadas
  IntVector userList = new IntVector();
  context.getUsers(userList);

  // para todos los usuarios

  for (int i=1; i<=userList.size(); i++)
  {
    // check if the skeleton is being tracked
    if (userList.size()>0)
    {
      PVector joint = new PVector();
      PVector rightHand = new PVector();
      PVector leftHand = new PVector();  
      context.startTrackingSkeleton(i);//inicia el rastreo del esqueleto
      context.getJointPositionSkeleton(i, SimpleOpenNI.SKEL_LEFT_HAND, joint);
      context.convertRealWorldToProjective(joint, leftHand);

      context.getJointPositionSkeleton(i, SimpleOpenNI.SKEL_RIGHT_HAND, joint);
      context.convertRealWorldToProjective(joint, rightHand);
      fill(0,10);
      //ellipse(leftHand.x*sizeFactorX,leftHand.y*sizeFactorY,50,50);
      //ellipse(rightHand.x*sizeFactorX,rightHand.y*sizeFactorY,50,50);
      for (int j = 0; j<gridSize;j++) {
        for (int k = 0; k<gridSize;k++) {
          grid[j][k].pointTo(leftHand.x*sizeFactorX, leftHand.y*sizeFactorY,150);
          grid[j][k].pointTo(rightHand.x*sizeFactorX, rightHand.y*sizeFactorY,150);      
          //display line
          //grid[i][j].displayLine();
          //display Arrow
          grid[j][k].displayVector();
        }
      }
    }
  }
}

