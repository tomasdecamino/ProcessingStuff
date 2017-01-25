ArrayList<PVector> coord = new ArrayList<PVector>();
int n = 5;
float[][] d = new float[n][2];

void setup() {
  size(displayWidth ,displayHeight);
  for (int i=0;i<n;i++) {
    coord.add(new PVector(random(width), random(height), 0));
  }
}

void draw() {
  background(255);
  strokeWeight(1);
  //noFill();
  stroke(0,100);
  for (int i=0;i<n;i++) {
    for (int j=0;j<n;j++) {
      d[j][0] = dist(coord.get(i).x, coord.get(i).y, coord.get(j).x, coord.get(j).y);
      d[j][1] = j;
    }
    bubbleSort();
    fill(random(255),random(255),random(255),50);
    line(coord.get(i).x,coord.get(i).y,coord.get((int)d[1][1]).x,coord.get((int)d[1][1]).y);
   // line(coord.get(i).x,coord.get(i).y,coord.get((int)d[2][1]).x,coord.get((int)d[2][1]).y);
   // triangle(coord.get(i).x,coord.get(i).y,coord.get((int)d[1][1]).x,coord.get((int)d[1][1]).y,coord.get((int)d[2][1]).x,coord.get((int)d[2][1]).y);
    coord.get(i).add(random(-10,10),random(-10,10),0);
  }
}



void bubbleSort() { 
  int i;
  float p, distance; 
  for (i=0;i<d.length-1;i++) { 
    if (d[i][0] > d[i+1][0]) {  
      // swap values 
      p = d[i][1];
      distance= d[i][0]; 
      d[i][0] = d[i+1][0];
      d[i][1] = d[i+1][1]; 
      d[i+1][1] = p;
      d[i+1][0] = distance;
    }
  }
} 

