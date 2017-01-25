import hypermedia.video.*;
OpenCV opencv;

//Automata celular de greenber & Hastings
// programado por tomas de Camino tomas.decamino@gmail.com

float  x1, y1, x2, y2, x3, y3;
// contantes para triangulo equilatero
int a = 5;
float x = a/2;
float y = a * sqrt(3)/3 * sin(radians(30));
float h = a * sqrt(3)/3;
int twidth, theight;

//Celular space
int rows = 160;
int cols = 120;
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

    size( 800, 600 );

    // open video stream
    opencv = new OpenCV( this );
    opencv.capture(160, 120);
    space[rows /2][cols /2] = 0;

}

void draw() {

     frameRate(20);
     background(0);

    opencv.read();           // grab frame from camera
    opencv.threshold(80);    // set black & white threshold 

  //AUtomata
    smooth();
    //strokeWeight(5);
    for(int i = 1; i < rows -1; i++){
     for(int j = 1 ; j < cols - 1; j++){
       spaceCopy[i][j] = greenberg(i,j);
       stroke(mycolours[spaceCopy[i][j]]);
       strokeWeight(spaceCopy[i][j]);
       point(i*5,j*5);
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
    for( int i=0; i<blobs.length; i++ ) {
        for( int j=0; j<blobs[i].points.length; j++ ) {
            //ortogonales
            strokeWeight(1);
            noFill();
            //ellipse(blobs[i].points[j].x *5,blobs[i].points[j].y*5,10,10);
            space[blobs[i].points[j].x][blobs[i].points[j].y] = 1;
            space[blobs[i].points[j].x+1][blobs[i].points[j].y] = 1;
            space[blobs[i].points[j].x-1][blobs[i].points[j].y] = 1;
            space[blobs[i].points[j].x][blobs[i].points[j].y-1] = 1;
            space[blobs[i].points[j].x][blobs[i].points[j].y+1] = 1;
            //diagonales
            space[blobs[i].points[j].x+1][blobs[i].points[j].y+1] = 1;
            space[blobs[i].points[j].x-1][blobs[i].points[j].y-1] = 1;
            space[blobs[i].points[j].x+1][blobs[i].points[j].y-1] = 1;
            space[blobs[i].points[j].x-1][blobs[i].points[j].y+1] = 1;
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
      res = 1;
    } else{
      res = 0;
    };
  } else {
      res = (space[i][j] + 1) % 17;
  }; 
  return res;
}
