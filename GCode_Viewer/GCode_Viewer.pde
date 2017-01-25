TGCode gcode; //<>//

void setup() {
  size(600, 600, P3D);
  gcode = new TGCode("portalapiz2.gcode");
  gcode.scale = 3;
  background(255);
  sphereDetail(10, 10);
  ortho();
 // camera(mouseX, height/2, (height/2) / tan(PI/6), mouseX, height/2, 0, 0, 1, 0);
}

void draw() {
  
  stroke(0,30);
  fill(255,10);
  strokeWeight(1);
  translate(0,0);
  gcode.drawBox(3);
  float x = gcode.cX*gcode.scale;
  float y = gcode.cY*gcode.scale;
  gcode.next(10);
  stroke(0,10);
  line(x,y,gcode.cX*gcode.scale,gcode.cX*gcode.scale);
}