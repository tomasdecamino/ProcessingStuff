import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.effects.*;
import processing.serial.*;

Serial port;
String data = "0";
 
Minim minim;
AudioOutput out;
SawWave square;
LowPassSP   lowpass;
 
void setup()
{
  size(10, 10);
 
  port = new Serial(this, Serial.list()[0], 9600);
  port.clear();
  port.bufferUntil('\n'); 
 
 
  minim = new Minim(this);
 
  // get a stereo line out with a sample buffer of 512 samples
  out = minim.getLineOut(Minim.STEREO, 512);
 
  // create a SquareWave with a frequency of 440 Hz, 
  // an amplitude of 1 and the same sample rate as out
  square = new SawWave(100, 100, 44100);
 
  // create a LowPassSP filter with a cutoff frequency of 200 Hz 
  // that expects audio with the same sample rate as out
  lowpass = new LowPassSP(100, 44100);
 
  // now we can attach the square wave and the filter to our output
  out.addSignal(square);
  out.addEffect(lowpass);
}
 
void draw(){

  println(data);
  if(float(data)>6000){
    square.setFreq(float(data)/100);
  }else{
    square.setFreq(0);
  }

}
 

void keyPressed()
{
  if ( key == 'm' )
  {
    if ( out.isMuted() ) 
    {
      out.unmute();
    }
    else 
    {
      out.mute();
    }
  }
}
 
void stop()
{
  out.close();
  minim.stop();
 
  super.stop();
}

void serialEvent(Serial port) {
  data = port.readStringUntil('\n');

}
