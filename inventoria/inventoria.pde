PShape s;

void setup() {
  size(600, 600);
  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("logo.svg");
  shapeMode(CENTER);
}

void draw() {
  PShape sc =s.getChild(7);
  shape(s, width/2, height/2);
  text(s.getVertexCount(),10,10);
}