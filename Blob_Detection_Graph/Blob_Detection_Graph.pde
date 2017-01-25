import hypermedia.video.*;


OpenCV opencv;

float dx, dy,dx2,dy2;
 int sminx,sminy,smaxx,smaxy;

void setup() {

  size(displayWidth, displayHeight);
  noCursor();
  // open video stream
  opencv = new OpenCV( this );
  opencv.capture(160, 90);
  sminx = 40;
  sminy = 14;
  smaxx =115;
  smaxy = 68;
  textSize(24);
  //cursor(CROSS);

}

void draw() {
  frameRate(30);
  background(255);
  noFill();
  smooth(8);
  //ellipse(mouseX,mouseY,200,200);
  opencv.read();           // grab frame from camera
  opencv.threshold(100);    // set black & white threshold 
  //image(opencv.image(), 0, 0);
  // find blobs width*height/2
  Blob[] blobs = opencv.blobs(2, 600, 20, true, 20);

  // draw blob results
  strokeWeight(10);
  stroke(0,50);
  float rand=sin(random(1));
  for ( int i=0; i<blobs.length; i++ ) {
    dx=map(blobs[i].centroid.x, sminx, smaxx, 0, width);
    dy=map(blobs[i].centroid.y, sminy, smaxy, 0, height);
    stroke(0,50);
    //ellipse(dx, dy, 100, 100);
   point(dx, dy); 
    for(int j = 0; j<blobs.length; j++){
       if(i!=j){
        dx2=map(blobs[j].centroid.x, sminx, smaxx, 0, width);
        dy2=map(blobs[j].centroid.y, sminy, smaxy, 0, height);
        float hip = sqrt(sq(dx-dx2)+sq(dy-dy2));
        stroke(0,255-map(hip,0,400,0,255)*2);
        line(dx,dy,dx2,dy2);
       }  
      
    }
    //fill(0);
    //text(blobs[i].centroid.x, width/2, height/2);
    //text(blobs[i].centroid.y, width/2+100, height/2);
   
  }


}

void keyPressed() {
  saveFrame();
}
