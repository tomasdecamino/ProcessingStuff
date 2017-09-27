/**
 * Framingham
 * by Ben Fry.
 *
 * Show subsequent frames from video input as a grid. Also fun with movie files.
 */


import processing.video.*;

Capture video;


// Buffer used to move all the pixels up

void setup() {
  size(640, 480);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, 640, 480);

  // Start capturing the images from the camera
  video.start(); 

  surface.setAlwaysOnTop(true);
  background(0);
}


void draw() {
  // By using video.available, only the frame rate need be set inside setup()
  if (video.available()) {
    video.read();
    image(video, 0, 0);
  }
}