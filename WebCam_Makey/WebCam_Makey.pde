import hypermedia.video.*;
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;

AudioSample s1,s2;


OpenCV opencv;

void setup() {
  size( displayWidth, displayHeight );
  opencv = new OpenCV( this );
  opencv.capture( width, height );  // open video stream
  
  minim = new Minim(this);
  s1 = minim.loadSample("snare_sample.wav", 1024);
  s2 = minim.loadSample("kick_sample.wav", 1024);
  
  
}

void draw() {
  opencv.read();                   // grab frame from camera
  strokeWeight(60);
  stroke(246, 86, 120, 148);
  image( opencv.image(), 0, 0 );   // and display image
  if (keyPressed) {
    if (keyCode == UP) {
      fill(250,250, 197, 100);
      ellipse(width/2+300, height/2, sin(frameCount)*500, sin(frameCount)*500);
      s1.trigger();
    }
    if (keyCode == DOWN) {
      fill(11, 46, 197, 100);
      ellipse(width/2-300, height/2, sin(frameCount)*500, sin(frameCount)*500);
      s2.trigger();
    }
  }
  else {
  }
}

void arrow(int x, int y, int l, float ang){
  //para determinar el largo de la punta en 45 grados
  int arrowLength = 100;
  pushMatrix();
  //cambia el eje del dibujo y lo rota
  translate(x, y);
  rotate(radians(ang));
  //dibuja una linea y flecha en el eje X
  line(0,0,l, 0);
  line(l, 0, l - arrowLength, -arrowLength);
  line(l, 0, l - arrowLength, arrowLength);
  popMatrix();
}
