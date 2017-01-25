/* User Position Tracking in Processing with SimpleOpenNI Wrapper by Max Rheiner */
import SimpleOpenNI.*;
SimpleOpenNI kinnect;

void setup()
{
  size(640,480,P3D); 
  kinnect = new SimpleOpenNI(this);
   
  // disable mirror
  kinnect.setMirror(false);

  // enable depthMap generation 
  kinnect.enableDepth();

  // enable skeleton generation for all joints
  kinnect.enableUser(); 
  kinnect.userImage();

}
 
void draw()
{
  // update the cam
  kinnect.update();

  background(0,0,0);
  
  // see the depth map
  image(kinnect.depthImage(),0,0); 
  
  // total user count from OpenNI
  int userCount = kinnect.getNumberOfUsers();
    
  // draw the center of mass
  PVector posRealWorld = new PVector();
  PVector posProjected = new PVector();
  PVector hands = new PVector();
  
  for(int userId = 1; userId <= userCount; userId++)
  {
    kinnect.startTrackingSkeleton(userId);
    // lets get user's center of mass coordinates in real world coordinate system
      kinnect.getCoM(userId,posRealWorld);

  // let's convert the center of mass position mapped to 640*480 
      kinnect.convertRealWorldToProjective(posRealWorld,posProjected);
      
      fill(100,255,100);
      point(posRealWorld.x,posRealWorld.y,posRealWorld.z);
      println(posRealWorld.x+","+posRealWorld.y+","+posRealWorld.z);

      //println(posProjected);
      ellipse(posProjected.x,posProjected.y,40,40); 


      
  }  
}
