import hypermedia.video.*;

OpenCV opencv;

float  x1, y1, x2, y2, x3, y3;
// contantes para triangulo equilatero
int a = 8;
float x = a/2;
float y = a * sqrt(3)/3 * sin(radians(30));
float h = a * sqrt(3)/3;
int twidth, theight;

//color array logo ADC2
color[] mycolours = {
  color(0, 170, 232), 
  color(5, 111, 192), 
  color(23, 52, 186), 
  color(25, 25, 87), 
  color(120, 78, 156), 
  color(79, 61, 147), 
  color(52, 67, 150), 
  color(35, 24, 119), 
  color(191, 215, 65), 
  color(145, 198, 55), 
  color(59, 177, 66), 
  color(0, 141, 64), 
  color(254, 197, 11),
  color(254, 132, 29), 
  color(229, 83, 0), 
  color(223, 55, 23),
  color(255, 255, 255)
} ;


void setup() {
    size(displayWidth, displayHeight);
    background(0);
    opencv = new OpenCV( this );
    opencv.capture( 133, 100 );  // open video stream
    
}

void draw() {
   frameRate(30);
   loadPixels();
   opencv.read(); //captura la imagen
   noStroke();
   smooth(); 
   set(0, 0, opencv.image());
  // if (mousePressed) {
     //image( opencv.image(), 0, 0 );
     loadPixels();
     for (int i = 0; i < 133; i++){
       for(int j = 0; j < 100; j++){
         int loc = i + (j * width) ;
         int r = int(red(pixels[loc])/255 *16);
         fill(mycolours[r]);
         triangleCenter(i+50,j);
       }           
     }
  // }  

}

void triangleCenter(float i, float j){
// funcion que construye un triangulo en posicion i,j
  boolean p = i % 2 == 0;
  boolean q = j % 2 == 0;
  float dx = i * x;
  float dy = j * (h+y);
  // operacion XOR
  if((p && q) || !(p || q)){
    triangle(dx + x, dy+y, dx-x, dy+y, dx, dy-h);
  } else {
    triangle(dx - x, dy-2*y, dx+x, dy-2*y, dx, dy+h-y);
  }
  
}
