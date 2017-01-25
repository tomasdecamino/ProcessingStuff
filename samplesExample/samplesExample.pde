import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;

AudioSample s1,s2;

void setup(){
 minim = new Minim(this);
// s2 = minim.loadSample("snd2.wav", 1024);
 s1 = minim.loadSample("snare_sample.wav", 1024);
 s2 = minim.loadSample("kick_sample.wav", 1024);
}

void draw(){
 s1.trigger(); 
 delay(500);
 s2.trigger();
 delay(500);
  
}



