//Automata celular de greenber & Hastings
// programado por tomas de Camino tomas.decamino@gmail.com
// contantes para triangulo equilatero

PFont f;

//Celular space
int rows = 200;
int cols = 200;
int[][] space = new int[rows][cols]; 
int[][] spaceCopy = new int[rows][cols]; 

void setup(){
  int i,j;
  size(600,600);
  fill(255);
 // twidth = int(width/x+2); 
 // theight = int(height/h);
  space[100][0] = 1;
  f = createFont("Times",16,true);

}

void draw(){
  frameRate(5);
  background(255);
  smooth(2);
  noStroke();
  space[int(random(200))][0] = int(random(255));
  for(int i = 1; i < rows -1; i++){
   for(int j = 1 ; j < cols - 1; j++){
     spaceCopy[i][j] = rule(i,j);
     fill(0,random(255));
     if(spaceCopy[i][j]>=1){
       textFont(f,int(random(100)));
       text(char(spaceCopy[i][j]),i*3,j*3);
   };
   }
  }
  for(int i = 0 ; i< rows; i++){
    for(int j = 0 ; j< cols; j++){
      space[i][j] = spaceCopy[i][j];
    }  
  }
}



int rule(int i, int j){
// AC de arribs
  int res = 0;
  if(space[i][j-1] == 0){
      res = 0;
    } else{
      res = space[i][j-1];
    };
  return res;
}

