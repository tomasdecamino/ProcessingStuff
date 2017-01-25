import hypermedia.video.*;

OpenCV opencv;

void setup() {
    size(displayWidth, displayHeight);
    background(0);
    opencv = new OpenCV( this );
    opencv.capture( 133, 100 );  // open video stream
}

void draw() {
   frameRate(24);
   loadPixels();
   opencv.read(); //captura la imagen
   noStroke();
   smooth(); 
   set(0, 0, opencv.image());
 //  if (mousePressed) {
     //image( opencv.image(), 0, 0 );

     loadPixels();
     for (int i = 0; i < 133; i++){
       for(int j = 0; j < 100; j++){
         int loc = i + (j * width) ;
         fill(pixels[loc], 100);
         int r = int(random(10,80));
         ellipse(200+i*5,150 + j*5, r, r);
       }           
     }
 // }  

}


