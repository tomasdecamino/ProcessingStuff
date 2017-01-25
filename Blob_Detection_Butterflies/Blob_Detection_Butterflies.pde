import hypermedia.video.*;


OpenCV opencv;

float dx, dy;
float bp[][]=new float[5][2];

void setup() {

  size(displayWidth, displayHeight);

  // open video stream
  opencv = new OpenCV( this );
  opencv.capture(160, 90);
  textSize(24);
  for(int i=0;i<5;i++){
    bp[i][0]=random(100,width-100);
    bp[i][1]=random(100,height-100);
  }
 // xb = width/2;
 // yb = height/2;
}

void draw() {

  background(255);
  noFill();
  //ellipse(mouseX,mouseY,200,200);
  opencv.read();           // grab frame from camera
  opencv.threshold(200);    // set black & white threshold 
  //image(opencv.image(), 0, 0);
  // find blobs width*height/2
  Blob[] blobs = opencv.blobs(10, 600, 10, true, 20);

  // draw blob results
  strokeWeight(1);
  stroke(100);
  for ( int i=0; i<blobs.length; i++ ) {
    dx=map(blobs[i].centroid.x, 44, 118, 0, width);
    dy=map(blobs[i].centroid.y, 22, 70, 0, height);
   // ellipse(dx, dy, 200, 200); 
    // for( int j=0; j<blobs[i].points.length; j++ ) {
    //      point(blobs[i].points[j].x *12, blobs[i].points[j].y * 5 );
    //  }

 
    //text(blobs[i].centroid.x, width/2, height/2);
    //text(blobs[i].centroid.y, width/2, height/2+25);
  }
  strokeWeight(1);
  stroke(0);
  fill(131,200,104);

  //xb=xb+(dx-xb)/8+random(10);
  //yb=yb+(dy-yb)/8+random(10);
  //loopPoint(xb,yb,5,random(-0.4,0.4),10);
  //loopPoint(xb,yb,5,random(3,3.24),10);
  for(int i=0;i<5;i++){
    bp[i][0]=bp[i][0]+(dx-bp[i][0])/((i*4+1)*3)+random(4);
    bp[i][1] = bp[i][1]+(dy-bp[i][1])/((i*4+1)*3)+random(4);
    butterfly(bp[i][0],bp[i][1],10,4);
   }
}

void butterfly(float x, float y, int l, float s){
  float ang = random(PI);
  loopPoint(x, y, l, ang+random(-0.4,0.4), s);
  loopPoint(x, y, l, ang+3.14+random(-0.4,0.4), s);
  
}

void loopPoint(float x, float y, int l, float ang, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  rotate(ang);
  beginShape();
  curveVertex(0, 0); 
  curveVertex(0, 0);
  curveVertex(l, l);
  curveVertex(l, -l);    
  curveVertex(0, 0);
  curveVertex(0, 0);   
  endShape();
  popMatrix();
}
