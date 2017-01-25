BufferedReader reader;
String line;

int R=1;//6371;//radio de la tierra en km

void setup() {
  // Open the file from the createWriter() example
  reader = createReader("Qdata.txt"); 
  size(displayWidth, displayHeight); 
  background(255);
  smooth(8);
}

void draw() {
  frameRate(30);
  strokeWeight(1);
  noStroke();
  fill(255);
  rect(0,0,300,200);
  fill(0);
  ellipse(50, 50, 20, 20);
  text("Particulas en el Aire", 80, 55);
  fill(148, 160, 93, 200);
  ellipse(50, 100, 20, 20);
  text("Velocidad (km/h)", 80, 105);
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
    noStroke();
    fill(231, 248, 154, 200);
    ellipse(width/2, height/2, speed*2, speed*2);
    text(pieces[2], width/2, height/2+speed*2);
    fill(56,88,181, 50);
    ellipse(width/2, height/2, air*2, air*2);
    noFill();
    stroke(255, 200);
    ellipse(width/2, height/2, 100*2, 100*2);
    stroke(0,150);
    strokeWeight(2);
    point(width-toX(x,y)*width-250,toY(x,y)*height);
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




