import processing.serial.*;
Serial port;
PrintWriter output;

float[] coord = new float[2];
String data="0,0";
long lastMillis=millis();
int count = 0;

int s = 100;
int x, y, mX, mY;
boolean click = false;

void setup() {
  size(displayWidth, displayHeight);
  x= width/2;
  y= height/2;
  fill(255, 0, 0);
  //configuracion de puerto serial
  println(Serial.list());
  port = new Serial(this, Serial.list()[5], 9600);
  port.clear();
  port.bufferUntil('\n');
  output = createWriter("Kevin_BambooPencil.txt");
  output.println("magnitude,size, circX,circY,mouseX,mouseY,steps");
  //archivo graba "magnitude,size, circX,circY,mouseX,mouseY,steps"
  ellipseMode(CENTER);
  ellipse(x, y, s, s);
  lastMillis=millis();
}


void draw() {
  count++;
  if (click) {
    mX = mouseX;
    mY = mouseY;
    if (millis()-lastMillis>200) {
      output.print(sqrt(sq(coord[0])+sq(coord[1])));
      output.print(",");
      output.print(s);
      output.print(",");
      output.print(x);
      output.print(",");
      output.print(y);
      output.print(",");
      output.print(mX);
      output.print(",");
      output.print(mY);
      output.print(",");
      output.println(count);
      s = (int)random(5, 100);
      background(0);
      x= (int)random(width-50);
      y= (int)random(height-50);
      ellipse(x, y, s, s);
      lastMillis=millis();
      count =1;
    }
    click=false;
  }

  output.print(sqrt(sq(coord[0])+sq(coord[1])));
  output.print(",0,0,0,");
  output.print(mouseX);
  output.print(",");
  output.print(mouseY);
  output.print(",");
  output.println(count);
  click = mousePressed;
}

void serialEvent(Serial port) {
  //data = port.readStringUntil('\n');
  data = port.readString();
  coord = float(split(data, ','));
}

void keyPressed() {
  output.flush();  
  output.close();  
  exit();
}

