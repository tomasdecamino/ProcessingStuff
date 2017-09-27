PShape s;
PVector  pm, pm2, bm1, bm2;
float a1, a2;

String[] pointFile;
PVector[] points = new PVector[11]; 

void setup() {
  size(800, 800, P3D);
  // The file "bot.obj" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("3DScan_1.obj");
  s.setFill(color(255, 200, 100));  
  //data points are ordered nippleL, nippleR, pointsL, pointsR, sternalNtochL, sternalNotchR
  pointFile = loadStrings("data_1.csv");

  //get points from file
  for (int i=0; i<pointFile.length; i++) {
    String[] list = split(pointFile[i], ',');
    points[i]=new PVector(float(list[0]), float(list[1]), float(list[2]));
  }


  //calculate nipples mid point
  pm = new PVector(points[0].x, points[0].y, points[0].z);
  pm.add((points[1].x-points[0].x)/2, (points[1].y-points[0].y)/2, (points[1].z-points[0].z)/2);

  //calculate thorax mid point
  pm2 = new PVector(points[4].x, points[4].y, points[4].z);
  pm2.add((points[8].x-points[4].x)/2, (points[8].y-points[4].y)/2, (points[8].z-points[4].z)/2);


  //calculate left/right breast plane mid point
  //using centroid of set points (barycenter)
  //bm1 centrod Left, bm2 centroid Right
  bm1 =  new PVector(0, 0, 0);
  bm2 =  new PVector(0, 0, 0);  
  for (int i=2; i<=5; i++) {
    bm1.add(points[i]);
    bm2.add(points[i+4]);
  }
  bm1.div(4);
  bm2.div(4);

  //Anlges for breast deviation
  a1=atan2(points[0].y-points[1].y, points[0].x-points[1].x);
  a2=atan2(points[10].y-pm2.y, points[10].x-pm2.x);
}

void draw() {
  background(0);

  //Display data points
  fill(255, 255);
  for (int i=0; i<pointFile.length; i++) {
    text(pointFile[i], 30, 50+i*20);
  }

  //breast height

  text("Height from thorax", 30, 280);
  text(abs(pm.z-pm2.z), 30, 300);

  //breast height from plane
  text("Height R from plane", 30, 350);
  text(bm1.dist(points[1]), 30, 370);
  text("Height L from plane", 30, 400);
  text(bm2.dist(points[0]), 30, 420);  

  //calculate angle difference from 0
  //convert to degrees
  //negative for right deviation, positive for left
  float ab = (a2-a1)*(180/PI);
  if (ab<0) {
    text(ab+90, 30, height-30);
  } else {
    text(ab-90, 30, height-30);
  }
  //display anlgle
  text("Angle", 30, height-50);




  // directionalLight(255, 255, 255, 3, 3, 0);
  lights();
  //camera(mouseX, mouseY, (height/2) / tan(PI/6), width/2, height/2, 0, 0, 1, 0);
  translate(width/2, height/2);
  rotate(PI+HALF_PI);
  rotateZ(map(mouseX, 0, width, -TWO_PI, TWO_PI));
  rotateX(map(mouseY, 0, height, -TWO_PI, TWO_PI));
  if (keyPressed) {
    shape(s, 0, 0);
  }
  stroke(255, 0, 0, 50);
  sphereDetail(4);

  fill(255, 200);
  //Nipple points
  strokeWeight(10);
  pushMatrix();
  translate(points[0].x, points[0].y, points[0].z);
  sphere(7);
  popMatrix();
  pushMatrix();
  translate(points[1].x, points[1].y, points[1].z);
  sphere(7);
  popMatrix();

  line(points[0].x, points[0].y, points[0].z, points[1].x, points[1].y, points[1].z);

  //Nipple Mid point
  pushMatrix();
  translate(pm.x, pm.y, pm.z);
  stroke(0, 255, 0, 50);
  sphere(3);
  popMatrix();

  //Chest Mid point
  pushMatrix();
  translate(pm2.x, pm2.y, pm2.z);
  stroke(0, 255, 0, 50);
  sphere(3);
  popMatrix();

  //left breast mid plane point
  pushMatrix();
  translate(bm1.x, bm1.y, bm1.z);
  sphere(7);
  popMatrix(); 

  //right breast mid plane point
  pushMatrix();
  translate(bm2.x, bm2.y, bm2.z);
  sphere(7);
  popMatrix(); 


  //rest of points
  stroke(255, 255, 0, 50);
  for (int i=2; i<points.length; i++) {
    pushMatrix();
    translate(points[i].x, points[i].y, points[i].z);
    sphere(7);
    popMatrix();
  }



  fill(255, 180);

  beginShape();
  vertex(points[2].x, points[2].y, points[2].z);
  vertex(points[3].x, points[3].y, points[3].z);
  vertex(points[4].x, points[4].y, points[4].z);
  vertex(points[5].x, points[5].y, points[5].z);
  endShape();

  beginShape();
  vertex(points[6].x, points[6].y, points[6].z);
  vertex(points[7].x, points[7].y, points[7].z);
  vertex(points[8].x, points[8].y, points[8].z);
  vertex(points[9].x, points[9].y, points[9].z);
  endShape();

  //plane from nipples

  fill(255, 100);
  beginShape();
  vertex(pm2.x, pm2.y, pm2.z);
  vertex(points[10].x, points[10].y, points[10].z);
  vertex(points[10].x, points[10].y, 50);
  vertex(pm2.x, pm2.y, 50);
  endShape();

  //plane for sternum
  beginShape();
  vertex(points[0].x, points[0].y, points[0].z);
  vertex(points[0].x, points[0].y, 50);
  vertex(points[1].x, points[1].y, 50);
  vertex(points[1].x, points[1].y, points[1].z);
  endShape();

  stroke(255, 0, 0, 255);
  line(bm1.x, bm1.y, bm1.z, points[1].x, points[1].y, points[1].z);
  line(bm2.x, bm2.y, bm2.z, points[0].x, points[0].y, points[0].z);

  line(pm2.x, pm2.y, pm2.z, points[10].x, points[10].y, points[10].z);

// line(-100, 0,-200, 100,0,-200);

  if (mousePressed) {
  saveFrame("frames/####.jpg");
  }
}

float findClose(PVector pV) {
  float c = 100000;
  PVector closeV;
  for (int i=0; i<s.getVertexCount(); i++) {
    PVector current = s.getVertex(i); 
    float d = pV.dist(current);
    if (d<c) {
      closeV=current;
      c=d;
    }
  }

  return c;
}