import hypermedia.video.*;
import java.awt.Rectangle;


OpenCV opencv;
PFont f;

//Celular space
int rows = 1280/10;
int cols = 800/10;
int[][] space = new int[rows][cols]; 
int[][] spaceCopy = new int[rows][cols]; 

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
    
    // open video stream
    opencv = new OpenCV( this );
    opencv.capture(displayWidth/10, displayHeight/10);
    opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );  
  // space[rows /2][cols /2] = 1;
   f = createFont("Arial",16,true);

}

void draw() {
     frameRate(30);
     background(0);
     textFont(f,8);

    opencv.read();           // grab frame from camera
    opencv.threshold(80);    // set black & white threshold 

  //AUtomata
    smooth(4);
    strokeWeight(10);
    for(int i = 1; i < rows -1; i++){
     for(int j = 1 ; j < cols - 1; j++){
       spaceCopy[i][j] = greenberg(i,j);
       stroke(mycolours[spaceCopy[i][j]%17]);
       //fill(mycolours[spaceCopy[i][j]%17]);
       point(i*10,j*10);
       //textFont(f,spaceCopy[i][j]*3);
       //text(str(spaceCopy[i][j]/10),i*10,j*10);
     }
    }
    for(int i = 0 ; i< rows; i++){
      for(int j = 0 ; j< cols; j++){
        space[i][j] = spaceCopy[i][j];
      }  
    }


// detect anything ressembling a FRONTALFACE
    Rectangle[] faces = opencv.detect();
    
    // draw detected face area(s)
    fill(255);
    for( int i=0; i<faces.length; i++ ) {
         space[faces[i].x][faces[i].width]=1; 
         point(faces[i].x*10,faces[i].height*10);  
    }
    
    
    //rest cells to cero
      if(keyPressed){
        for(int i = 0 ; i< rows; i++){
          for(int j = 0 ; j< cols; j++){
            space[i][j] = 0;
          }  
        }  
      }
}

int greenberg(int i, int j){
// AC de greenberg y hastings
  int res;
  if(space[i][j] == 0){
    int total = space[i][j-1] + space[i+1][j-1] + space[i-1][j-1];
    if(total > 1){ 
      res = 1;
    } else{
      res = 0;
    };
  } else {
      res = (space[i][j] + 1) % 17;
  }; 
  return res;
}
