//Automata celular de greenber & Hastings
// programado por tomas de Camino tomas.decamino@gmail.com

float  x1, y1, x2, y2, x3, y3;
// contantes para triangulo equilatero
int a = 20;
float x = a/2;
float y = a * sqrt(3)/3 * sin(radians(30));
float h = a * sqrt(3)/3;
int twidth, theight;

//Celular space
int rows = 60;
int cols = 36;
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

void setup(){
  int i,j;
  size(600,600);
  fill(255);
  twidth = width/rows; 
  theight = height/cols;
  space[rows /2][cols /2] = 1;


}

void draw(){
  frameRate(10);
  background(0);
  smooth();
  stroke(10);
  for(int i = 1; i < rows -1; i++){
   for(int j = 1 ; j < cols - 1; j++){
     spaceCopy[i][j] = oneIneight(i,j);
     fill(255 * spaceCopy[i][j]);
     ellipse(i*twidth,j*theight,20,20);
   }
  }
  for(int i = 0 ; i< rows; i++){
    for(int j = 0 ; j< cols; j++){
      space[i][j] = spaceCopy[i][j];
    }  
  }
  if(mousePressed){
    space[int(mouseX/x)][int(mouseY/(h+y))]=1;
  }
  if(keyPressed){
    for(int i = 0 ; i< rows; i++){
      for(int j = 0 ; j< cols; j++){
        space[i][j] = 0;
      }  
    }  
  }
}

int oneIneight(int i, int j){
// AC de greenberg y hastings
  int res;
  int total=0;
  if(space[i][j] == 0){
    for(int k = -1; k<2; k++){
     for(int l = -1; l<2; l++){
      total = total + space[i+k][j+l];
     } 
    }
    if(total == 1){ 
      res = 1;
    } else{
      res = 0;
    };
  } else {
      res = space[i][j] ;
  }; 
  return res;
}

