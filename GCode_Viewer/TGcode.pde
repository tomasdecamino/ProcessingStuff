// Simple GCode Viewer

class TGCode {
  String[] gcode;
  int position=0;
  float cX=0, cY=0, cZ=0;
  float scale =10;

  TGCode(String filename) {
    gcode = loadStrings(filename);
    next();
  }

  void drawPoint() {
    point(cX, cY, cZ);
  }

  void drawBox(float s) {
    pushMatrix();
    translate(cX*scale, cY*scale, cZ*scale);
    box(s*scale);
    popMatrix();
  }

  void next() {
    String[] tokens;
    position++;
    if (position<gcode.length) {
      tokens = splitTokens(gcode[position]);
      while (tokens[0].indexOf("G1")==-1) {
        position++;
        tokens = splitTokens(gcode[position]);
      }
      getCoordinates();
    }
  }

  void next(int n) {
    for(int i=0;i<n;i++)next();
  }

  void getCoordinates() {
    String[] tokens;
    float x=0, y=0, z=0;
    tokens = splitTokens(gcode[position]);
    for (int j=1; j<tokens.length; j++) {
      switch(tokens[j].charAt(0)) {
      case 'X': 
        x = float(tokens[j].substring(1));
        break;
      case 'Y': 
        y = float(tokens[j].substring(1));
        break;
      case 'Z': 
        z = float(tokens[j].substring(1));
        break;
      }
      if (x!=0) cX=x; 
      else x=cX;
      if (y!=0) cY=y ; 
      else y=cY;
      if (z!=0) cZ=z ; 
      else z=cZ;
    }
  }
}