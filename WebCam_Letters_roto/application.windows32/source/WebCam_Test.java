import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import hypermedia.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class WebCam_Test extends PApplet {



OpenCV opencv;

public void setup() {
    size(displayWidth, displayHeight);
    background(0);
    opencv = new OpenCV( this );
    opencv.capture( 133, 100 );  // open video stream
}

public void draw() {
   loadPixels();
   opencv.read(); //captura la imagen
   noStroke(); 
   set(0, 0, opencv.image());
   if (mousePressed) {
     //image( opencv.image(), 0, 0 );

     loadPixels();
     for (int i = 0; i < width; i++){
       for(int j = 0; j < height; j++){
         int loc = i + (j * width) ;
         fill(pixels[loc]);
         int r = PApplet.parseInt(random(10,100));
         ellipse(150+i*5,150 + j*5, r, r);
       }           
     }
  }  

}


  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "WebCam_Test" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
