import hypermedia.video.*;


OpenCV opencv;

Creature player1,ball,player2;

int a = 20;
int d =2;
float x = a/2;
float y = a * sqrt(3)/3 * sin(radians(30));
float h = a * sqrt(3)/3;
int twidth =120;
int theight=100;
int dx,dy,dx2,dy2;
float s;
int score = 0;

void setup() {

    size(displayWidth, displayHeight);

    // open video stream
    opencv = new OpenCV( this );
    opencv.capture(twidth,theight);
    player1=new Creature(width/2, height/2, 100, 20);
    player2=new Creature(width/2, height/2, 100, 4);
    ball=new Creature(width/2, height/2, 50, 100);
    player1.velocity.set(0, 0, 0);
    player2.velocity.set(0, 0, 0);

}

void draw() {
    noFill();
    smooth(8);
    background(0);

    opencv.read();           // grab frame from camera
    opencv.threshold(230);    // set black & white threshold 
   // opencv.convert( GRAY );
   // image(opencv.image(), 0,0,width,height); 
  
    // find blobs width*height/2
    Blob[] blobs = opencv.blobs( 100, width*height, 1, true);
    // draw blob results
    strokeWeight(3);
    stroke(245,244,235);
    drawNet(100,200);
    strokeWeight(5);
    stroke(222,92,245);  
    if(blobs.length>=1){
         dx=width-blobs[0].centroid.x *(width/twidth)*d;
         dx=constrain(dx,0,width);
         dy=blobs[0].centroid.y * height/theight*d;
         dy=constrain(dy,0,height);
         //dx2=width-blobs[1].centroid.x *(width/twidth)*d;
         //dx2=constrain(dx2,0,width);
         //dy2=blobs[1].centroid.y * height/theight*d;
         //dy2=constrain(dy2,0,height);
         player1.critPosition(dx,dy);
         //player2.critPosition(dx2,dy2);
         ball.push(player1.center.x,player1.center.y,150);
         //ball.push(player2.center.x,player1.center.y,150);
         ball.update();
         ball.checkEdges();
        //player2.update();
    //     player1.update();
    }
    strokeWeight(4);
    stroke(91,230,107,100);
    ball.display();
    stroke(67,109,195,150);
    player1.display();
   // player2.display();
}

void drawNet(int x, int y){
      for(int i=0; i<200; i=i+10){    
         beginShape();
            curveVertex(x,y+i); // the first control point
            curveVertex(x,y+i); // is also the start point of curve
            curveVertex(x+random(-25,25),y+i+random(-25,25));
            curveVertex(x+random(-25,25),y+i+random(-25,25));
            curveVertex(x+50,y+i); // the last point of curve
            curveVertex(x+50,y+i); 
         endShape();
      }
         
}

