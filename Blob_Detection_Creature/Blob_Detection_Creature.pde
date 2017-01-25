import hypermedia.video.*;


OpenCV opencv;

Creature crit,crit2;

int a = 20;
int d =2;
float x = a/2;
float y = a * sqrt(3)/3 * sin(radians(30));
float h = a * sqrt(3)/3;
int twidth =120;
int theight=100;
int dx,dy;
float s;
int score = 0;

void setup() {

    size(displayWidth, displayHeight);

    // open video stream
    opencv = new OpenCV( this );
    opencv.capture(twidth,theight);
    crit=new Creature(width/2, height/2, 50, 30);
    crit2=new Creature(width/2, height/2, 100, 100);
    crit.velocity.set(0, 0, 0);

}

void draw() {
    noFill();
    smooth(8);
    background(0);

    opencv.read();           // grab frame from camera
    opencv.threshold(230);    // set black & white threshold 
   // opencv.convert( GRAY );
   // image(opencv.image(), 0,0,width,height); 
  
    // find blobs width*height/2
    Blob[] blobs = opencv.blobs( 100, width*height, 1, true);

    // draw blob results
        strokeWeight(3);
    stroke(245,244,235);
    drawNet(100,200);
    strokeWeight(5);
    stroke(222,92,245);
    for( int i=0; i<blobs.length; i++ ) {     
         dx=width-blobs[i].centroid.x *(width/twidth)*d;
         dx=constrain(dx,0,width);
         dy=blobs[i].centroid.y * height/theight*d;
         dy=constrain(dy,0,height);
         s = sin(frameCount)*150;
         ellipse(dx, dy,s,s);
         crit.critPosition(dx,dy);
         crit2.push(crit.center.x,crit.center.y,150);
         crit2.update();
         crit2.checkEdges();
         crit.update();
  
    }
    strokeWeight(4);
    stroke(91,230,107,100);
    crit2.display();
    stroke(67,109,195,150);
    crit.display();
}

void drawNet(int x, int y){
      for(int i=0; i<400; i=i+10){    
         beginShape();
            curveVertex(x,y+i); // the first control point
            curveVertex(x,y+i); // is also the start point of curve
            curveVertex(x+random(-25,25),y+i+random(-25,25));
            curveVertex(x+random(-25,25),y+i+random(-25,25));
            curveVertex(x+100,y+i); // the last point of curve
            curveVertex(x+100,y+i); 
         endShape();
      }
         
}

