import hypermedia.video.*;


OpenCV opencv;

void setup() {
    size( displayWidth, displayHeight );
    opencv = new OpenCV( this );
    opencv.capture( width, height );  // open video stream
}

void draw() {
    opencv.read();                   // grab frame from camera
    image( opencv.image(), 0, 0 );   // and display image
}
