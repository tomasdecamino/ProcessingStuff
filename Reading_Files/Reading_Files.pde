BufferedReader reader;

int R=1;//6371;//radio de la tierra en km

void setup() {
  reader = createReader("Qdata.txt");
  size(600, 600);
}

void draw() {
  background(0);
  String line = getLine(reader);

  if (line!=null) {
    String[] tokens=split(line,',');
    float lat =float(tokens[0]);
    float lon =float(tokens[1]);
    text(toX(lat,lon), width/2, height/2);
    
  }
  else {
    noLoop();
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
String getLine(BufferedReader r) {
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

