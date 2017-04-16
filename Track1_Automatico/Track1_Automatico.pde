/*
This is a sound file player. 
 */


import processing.sound.*;

SoundFile soundfile, track;

float a=0;

void setup() {
  size(displayWidth, displayHeight);
  background(255);


  //Load a soundfile
  soundfile = new SoundFile(this, "base.mp3");
  track = new SoundFile(this, "t1.mp3");
  // These methods return useful infos about the file
  println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
  println("SFSamples= " + soundfile.frames() + " samples");
  println("SFDuration= " + soundfile.duration() + " seconds");

  // Play the file in a loop
  soundfile.amp(0.7);
  track.amp(0.01);
  smooth(8);
  soundfile.play();
}      


void draw() {
  if (frameCount%300==0) {
    soundfile.stop();
    soundfile.play();
  }
  //canvas erase
  fill(255, 1);
  rect(-1, -1, width+1, height+1);

  if (mousePressed) {
    track.play();
    float d = dist(mouseX, mouseY, width/2, height/2);
    track.rate(map(d, 0, width/2, 4.0, 1.0));
    noFill();
    stroke(#68A1F0, 200);
    ellipse(mouseX, mouseY, d-10, d-10);
    track.pan(map(mouseX,0,width,-1.0,1.0));
    track.amp(map(mouseY,0,height,0.001,0.2));
  }

  pushMatrix();
  translate(width/2, height/2);
  rotate(a);
  stroke(255, 255);
  strokeWeight(5);
  line(-1, 0, -1, width);
  stroke(0, 255);
  strokeWeight(1);
  line(0, 0, 0, width);
  popMatrix();
  a+=0.01;
}