import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;

void setup() {

    size( 320, 240 );
   
    background(255);
   
    opencv = new OpenCV(this);
    opencv.capture( width, height );
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );    // load the FRONTALFACE description file
}

void draw() {
    
    opencv.read();
    image( opencv.image(), 0, 0 );
    
    // detect anything ressembling a FRONTALFACE
    Rectangle[] faces = opencv.detect();
    
    // draw detected face area(s)
    //noFill();
   // noStroke();
     fill(0);
    strokeWeight(30);
    for( int i=0; i<faces.length; i++ ) {
        ellipse((faces[i].x+faces[i].width/2), faces[i].y+faces[i].height/2,20,20); 
    }
}

