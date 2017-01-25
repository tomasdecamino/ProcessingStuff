//@author> Tomas de Camino

import processing.serial.*;
import hypermedia.video.*;
import java.awt.Rectangle;

OpenCV opencv;
Serial port; 
int th=10;

void setup() {

  size( 320, 240 );

  background(255);

  opencv = new OpenCV(this);
  opencv.capture( width, height );
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT ); 
  port = new Serial(this, Serial.list()[0], 9600);
}

void draw() {

  opencv.read();
  image( opencv.image(), 0, 0 );

  // detect anything ressembling a FRONTALFACE
  Rectangle[] faces = opencv.detect();

  // draw detected face area(s)
  noFill();
  // noStroke();
  //fill(0);
  stroke(0,255,0);
  strokeWeight(3);
  for ( int i=0; i<faces.length; i++ ) {
    rect((faces[i].x), faces[i].y, 50, 50);
    float pos =(faces[i].x+faces[i].width/2)-width/2;
    if(pos>th){
      port.write('R'); 
      println('R');  
    }if(pos<-th){
      port.write('L');
      println('L');        
    }else{
      println('C');
    }
  }
}

