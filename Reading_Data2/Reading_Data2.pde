BufferedReader reader;
String line;

int R=1;//6371;//radio de la tierra en km

void setup() {
  // Open the file from the createWriter() example
  reader = createReader("LOG00011.TXT"); 
  size(displayWidth, displayHeight); 
  background(255);
  smooth(8);
}

void draw() {
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
    //text(toX(x,y),10,10);
    strokeWeight(3);
    stroke(0);
    point(toX(x,y)*width,toY(x,y)*height);
    println(toX(x,y)*1000);
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




