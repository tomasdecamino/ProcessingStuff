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
  twidth = int(width/x+2); 
  theight = int(height/h);
  space[rows /2][cols /2] = 0;


}

void draw(){
  frameRate(10);
  background(0);
  smooth();
  noStroke();
  for(int i = 1; i < rows -1; i++){
   for(int j = 1 ; j < cols - 1; j++){
     spaceCopy[i][j] = greenberg(i,j);
     fill(mycolours[spaceCopy[i][j]]);
     triangleCenter(i,j);
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

void triangleCenter(int i, int j){
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

int greenberg(int i, int j){
// AC de greenberg y hastings
  int res;
  if(space[i][j] == 0){
    int total = space[i-1][j] + space[i][j-1] + space[i+1][j] + space[i][j+1];
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

