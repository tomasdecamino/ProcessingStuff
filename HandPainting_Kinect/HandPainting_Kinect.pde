// Daniel Shiffman
// Tracking the average location beyond a given depth threshold
// Thanks to Dan O'Sullivan
// http://www.shiffman.net
// https://github.com/shiffman/libfreenect/tree/master/wrappers/java/processing

import org.openkinect.*;
import org.openkinect.processing.*;

// Showing how we can farm all the kinect stuff out to a separate class
KinectTracker tracker;
// Kinect Library object
Kinect kinect;

void setup() {
  size(640,520);
  kinect = new Kinect(this);
  tracker = new KinectTracker();
}

void draw() {
  smooth(8);
  fill(255,2);
  rect(0,0,width,height);

  // Run the tracking analysis
  tracker.track();
  // Show the image
  //tracker.display();

  // Let's draw the raw location
 /* PVector v1 = tracker.getPos();
  fill(50,100,250,200);
  noStroke();
  ellipse(v1.x,v1.y,20,20);*/

  // Let's draw the "lerped" location
  PVector v2 = tracker.getLerpedPos();
  noFill();
  stroke(0,100);
  int s = 10+frameCount%50;
  ellipse(v2.x,v2.y,s,s);

  // Display some info
 /* int t = tracker.getThreshold();
  fill(0);
  text("threshold: " + t + "    " +  "framerate: " + (int)frameRate + "    " + "UP increase threshold, DOWN decrease threshold",10,500);
  */
}

void keyPressed() {
  int t = tracker.getThreshold();
  if (key == CODED) {
    if (keyCode == UP) {
      t+=5;
      tracker.setThreshold(t);
    } 
    else if (keyCode == DOWN) {
      t-=5;
      tracker.setThreshold(t);
    }
  }
}

void stop() {
  tracker.quit();
  super.stop();
}

