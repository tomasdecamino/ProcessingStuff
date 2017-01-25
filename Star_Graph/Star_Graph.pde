FloatList nodeX;
FloatList nodeY;
float x, y;
int s =30;

void setup() {
  size(displayWidth, displayHeight);
  nodeX = new FloatList();
  nodeY = new FloatList(); 
  nodeX.append(width/2);
  nodeY.append(height/2);
  x=nodeX.get(0);
  y=nodeY.get(0);
  smooth();
}

void draw() {
  background(255);
  for (int i = nodeX.size()-1; i >= 0; i--) {
    if (i==0) {
      fill(0,0,0,255);
    }
    else {
      fill(0, 0, 0, 255);
    }
    strokeWeight(3);
    stroke(0, 100);
    line(x, y, nodeX.get(i), nodeY.get(i));
    stroke(0, 150);
    strokeWeight(1);
    ellipse(nodeX.get(i), nodeY.get(i), s, s);
    /*for (int j = nodeX.size()-1; j >= i; j--) {
      stroke(0, 10);
      line(nodeX.get(i), nodeY.get(i),nodeX.get(j), nodeY.get(j));
    }*/
  }
  stroke(0, 150);
  ellipse(x, y, s*2, s*2);
  if(keyPressed){
   saveFrame("frames/####.png"); 
  }
}

void mousePressed() {
  // A new ball object is added to the ArrayList, by default to the end.
  nodeX.append(mouseX);
  nodeY.append(mouseY);
}

