import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Sample extends PApplet {

/*
This is a sound file player. 
*/




SoundFile soundfile;

public void setup() {
    
    background(255);
        
    //Load a soundfile
    soundfile = new SoundFile(this, "vibraphon.aiff");

    // These methods return useful infos about the file
    println("SFSampleRate= " + soundfile.sampleRate() + " Hz");
    println("SFSamples= " + soundfile.frames() + " samples");
    println("SFDuration= " + soundfile.duration() + " seconds");

    // Play the file in a loop
    soundfile.loop();
}      


public void draw() {
  // Map mouseX from 0.25 to 4.0 for playback rate. 1 equals original playback 
  // speed 2 is an octave up 0.5 is an octave down.
  soundfile.rate(map(mouseX, 0, width, 0.25f, 4.0f)); 
  
  // Map mouseY from 0.2 to 1.0 for amplitude  
  soundfile.amp(map(mouseY, 0, width, 0.2f, 1.0f)); 
 
  // Map mouseY from -1.0 to 1.0 for left to right 
  soundfile.pan(map(mouseY, 0, width, -1.0f, 1.0f));  
}
  public void settings() {  size(640,360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Sample" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
