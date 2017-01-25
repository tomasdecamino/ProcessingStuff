import hypermedia.video.*;

OpenCV opencv;

PFont font;
int xr;
int yr;
int vwidth=120;
int vheigth = 80;

void setup() {
    size(displayWidth, displayHeight);
    background(0);
    opencv = new OpenCV( this );
    opencv.capture( vwidth, vheigth );  // open video stream
    font = createFont("Times",32,true);
    textFont(font,24);
    xr = width/vwidth;
    yr = height/vheigth;
    textAlign(CENTER);
}

void draw() {
   background(0);
   frameRate(30);
   loadPixels();
   opencv.read(); //captura la imagen
   noStroke();
   smooth(); 
   set(0,0, opencv.image());
 //  if (mousePressed) {
     //image( opencv.image(), 0, 0 );

     loadPixels();
     for (int i = 0; i < vwidth; i= i+2){
       for(int j = 0; j < vheigth; j= j+2){
         int loc = i + (j * width) ;
         fill(pixels[loc], 200);
         textFont(font,int(random(76)));
         text(char(int(random(35, 127))),i*xr,j*yr);
       }           
     }
 // }  
 saveFrame("frames/####.tif");

}


