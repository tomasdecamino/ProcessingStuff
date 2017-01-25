import hypermedia.video.*;


OpenCV opencv;

int a = 10;
float x = a/2;
float y = a * sqrt(3)/3 * sin(radians(30));
float h = a * sqrt(3)/3;
int twidth, theight;

void setup() {

    size(displayWidth, displayHeight);

    // open video stream
    opencv = new OpenCV( this );
    opencv.capture(displayWidth/10,displayHeight/10);


}

void draw() {

    background(255);

    opencv.read();           // grab frame from camera
    opencv.threshold(200);    // set black & white threshold 
    opencv.convert( GRAY );
    image(opencv.image(), 0, 0 ,160,120);  
    // find blobs width*height/2
    Blob[] blobs = opencv.blobs( 100, width*height, 1, true);

    // draw blob results
    strokeWeight(10);
    stroke(255,0,0);
    for( int i=0; i<blobs.length; i++ ) {     
         point(blobs[i].centroid.x *10, blobs[i].centroid.y * 10 );
  
    }

}

