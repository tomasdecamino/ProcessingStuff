/**
  * This sketch demonstrates how to play a file with Minim using an AudioPlayer. <br />
  * It's also a good example of how to draw the waveform of the audio.
  */
int s=1000;
float rad =0;


import ddf.minim.*;

Minim minim;
AudioPlayer player;


void setup()
{
  size(1920, 1080);
  
  // we pass this to Minim so that it can load files from the data directory
  minim = new Minim(this);
  
  // loadFile will look in all the same places as loadImage does.
  // this means you can find files that are in the data folder and the 
  // sketch folder. you can also pass an absolute path, or a URL.
  player = minim.loadFile("Arpegios.mp3");
  
  // play the file
  background(255);
  smooth();
  player.play();
}

void draw()
{
  frameRate(15);
  noStroke();
  //fill(255,5);
  //rect(0,0,width,height);
  //background(255);
  fill(random(255),random(255),random(255),100);
  stroke(0,50);
  //noFill();
  // draw the waveforms
  // the values returned by left.get() and right.get() will be between -1 and 1,
  // so we need to scale them up to see the waveform
  // note that if the file is MONO, left.get() and right.get() will return the same value
 /* for(int i = 0; i < player.bufferSize() - 1; i++)
  {
    float x1 = map( i, 0, player.bufferSize(), 0, width );
    float x2 = map( i+1, 0, player.bufferSize(), 0, width );
    rect( random(0,width), random(0,height), player.left.get(i+1)*50,  player.left.get(i+1)*50 );
    rect( random(0,width), random(0,height), player.right.get(i+1)*50,  player.right.get(i+1)*50 );
  }*/
    lineDraw(rad, player.left.get(0)*s);
  //  ellipse( random(0,width), height/2-100, player.left.get(0)*s,  player.left.get(0)*s );
  //  ellipse( random(0,width), height/2+100, player.right.get(0)*s,  player.right.get(0)*s);
   // shots.add(get());
    if(!player.isPlaying()) exit();
    //saveFrame("frames/####.jpg");
  rad+=0.01;
}

void lineDraw(float r, float s){
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(r);
  for(int i=0;i<10;i++){
    rect(i*s,0,abs(s),abs(s));
  }
  popMatrix();
}
