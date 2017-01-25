import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;

AudioSample s1;

void setup(){
  minim = new Minim(this);
  s1 = minim.loadSample("gun-gunshot-01.wav", 1024);
}

void draw(){
  if(keyPressed){
   s1.trigger();
  }
  
}
