String[] data;
int[] filter = {-1,-2,-3,3,2,1};

int filoFirst=0;
int pos = 0;

void setup(){
  size(800,800);
  data = loadStrings("dataZ.csv");
}

void draw(){
  strokeWeight(10);
  float x= map(pos,0,data.length,0,width);
  //add new
  int sum=0;
  for(int i=0;i<6;i++){
    sum+=int(data[pos+i])*filter[i];
  }
  stroke(255,0,0);
  point(x,sum/5);
  stroke(0);
  point(x,float(data[pos]));
  
  
  pos=(pos+1)%data.length;
}