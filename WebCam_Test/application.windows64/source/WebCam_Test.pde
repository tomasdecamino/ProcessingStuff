import hypermedia.video.*;

OpenCV opencv;

void setup() {
    size(displayWidth, displayHeight);
    background(0);
    opencv = new OpenCV( this );
    opencv.capture( 133, 100 );  // open video stream
}

void draw() {
   loadPixels();
   opencv.read(); //captura la imagen
   noStroke(); 
   set(0, 0, opencv.image());
   if (mousePressed) {
     //image( opencv.image(), 0, 0 );

     loadPixels();
     for (int i = 0; i < width; i++){
       for(int j = 0; j < height; j++){
         int loc = i + (j * width) ;
         fill(pixels[loc]);
         int r = int(random(10,100));
         ellipse(150+i*5,150 + j*5, r, r);
       }           
     }
  }  

}


