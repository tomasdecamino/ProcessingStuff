BufferedReader reader;
String line;

int R=1;//6371;//radio de la tierra en km

void setup() {
  // Open the file from the createWriter() example
  reader = createReader("Qdata.txt"); 
  size(600, 600); 
  background(255);
  smooth(8);
}

void draw() {
  frameRate(30);
  strokeWeight(1);
  line = getLine(reader);
  if (line == null) {
    // detiene el loop
    noLoop();
  } 
  else {
    //divide la linea en elementos separados por coma
    String[] pieces = split(line, ',');
    float x = float(pieces[0]);
    float y = float(pieces[1]);
    float speed =float(pieces[2]);
    float air= float(pieces[3]);
    stroke(0,20);
    fill(255,0,0,20);
    ellipse(map(toX(x,y),0.6,0.8,0,width),map(toY(x,y),0.4,0.7,0,height),speed*2,speed*2);
  }
} 

//geographic to cartessian
float toX(float lat, float lon) {
  float x = R * cos(lat) * cos(lon);
  return x;
}

float toY(float lat, float lon) {
  float y = R * cos(lat) * sin(lon);
  return y;
}

//get each file line
String getLine(BufferedReader r){
  String l;
  try {
   l = r.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    l = null;
  } 
  return l;
}