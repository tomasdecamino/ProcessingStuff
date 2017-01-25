import hypermedia.video.*;
OpenCV opencv;
PFont f;

//Celular space
int rows = 1280/10;
int cols = 800/10;
int[][] space = new int[rows][cols]; 
int[][] spaceCopy = new int[rows][cols]; 


void setup() {

    size(displayWidth, displayHeight);
    
    // open video stream
    opencv = new OpenCV( this );
    opencv.capture(displayWidth/10, displayHeight/10);
   // space[rows /2][cols /2] = 0;
   f = createFont("Arial",16,true);

}

void draw() {
     frameRate(30);
     background(0);
     textFont(f,8);

    opencv.read();           // grab frame from camera
    opencv.threshold(80);    // set black & white threshold 

  //AUtomata
    smooth();
    strokeWeight(10);
    for(int i = 1; i < rows -1; i++){
     for(int j = 1 ; j < cols - 1; j++){
       spaceCopy[i][j] = greenberg(i,j);
       //stroke(0,spaceCopy[i][j],0);
       fill(0,spaceCopy[i][j],0);
       //point(i*10,j*10);
       text(str(spaceCopy[i][j]/10),i*10,j*10);
     }
    }
    for(int i = 0 ; i< rows; i++){
      for(int j = 0 ; j< cols; j++){
        space[i][j] = spaceCopy[i][j];
      }  
    }

    // find blobs width*height/2
    Blob[] blobs = opencv.blobs( 100, width*height/2, 20, true);

    // Sets new values based on blaobs
    for( int i = 0; i<blobs.length; i++ ) {
        for( int j=0; j<blobs[i].points.length; j++ ) {
            //ortogonales
            strokeWeight(1);
            noFill();
            //ellipse(blobs[i].points[j].x *5,blobs[i].points[j].y*5,10,10);
            space[(rows-1)-blobs[i].points[j].x][blobs[i].points[j].y] = 1;
           // space[blobs[i].points[j].x+1][blobs[i].points[j].y] = 1;
           // space[blobs[i].points[j].x-1][blobs[i].points[j].y] = 1;
           // space[blobs[i].points[j].x][blobs[i].points[j].y-1] = 1;
           //space[blobs[i].points[j].x][blobs[i].points[j].y+1] = 1;
            //diagonales
            space[(rows-1)-blobs[i].points[j].x+1][blobs[i].points[j].y+1] = 1;
            space[(rows-1)-blobs[i].points[j].x-1][blobs[i].points[j].y-1] = 1;
            space[(rows-1)-blobs[i].points[j].x+1][blobs[i].points[j].y-1] = 1;
            space[(rows-1)-blobs[i].points[j].x-1][blobs[i].points[j].y+1] = 1;
        }
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
    int total = space[i-1][j] + space[i][j-1] + space[i+1][j] + space[i][j+1];
    if(total > 2){ 
      res = 20;
    } else{
      res = 0;
    };
  } else {
      res = (space[i][j] + 10) % 200;
  }; 
  return res;
}
