/* @author: Tomas de Camino Beck
 @version: 1.0 Sep 2017
 www.funcostarica.org
 */

PImage headerImg;//Image on top

//command images
PImage red1, red2, red3, green1, green2, green3, blue1, blue2, blue3,black,white, time1, time2, time3;

String mainFilePath="";//path to main.py on Gemma M0
String[] codeHeader;//stored header code

//dynamic array for command list
ArrayList<Command> instruction = new ArrayList<Command>();

//"hot spots" for header image
int iconYpos = 52;
int[] iconXpos = {32, 90, 149, 220, 279, 337, 409, 468, 525, 600, 656, 723, 774, 843, 920};

//for dragging visual commands
boolean newCommand=false;


void setup() {
  size (960, 400);
  background(255);

  //load icon and header images
  red1 = loadImage("red1.png");
  red2 = loadImage("red2.png");
  red3 = loadImage("red3.png");
  green1 = loadImage("green1.png");
  green2 = loadImage("green2.png");
  green3 = loadImage("green3.png");
  blue1 = loadImage("blue1.png");
  blue2 = loadImage("blue2.png");
  blue3 = loadImage("blue3.png");
  black = loadImage("black.png");
  white = loadImage("white.png");  
  time1 = loadImage("time1.png");
  time2 = loadImage("time2.png");
  time3 = loadImage("time3.png");
  headerImg = loadImage("toolbox.png");

  //load header code
  codeHeader = loadStrings("mainHeader.py");
  //opens window for file selection
  selectInput("Seleccionar main.py", "fileSelected");
}

void draw() {
  //draws header image
  background(255);
  //display menu bar
  imageMode(CORNER);
  image(headerImg, 0, 0);
  imageMode(CENTER);

  fill(0);
  //text(mouseX+","+mouseY, 10, 10);

  //draw instructions on canvas
  for (int i=0; i<instruction.size(); i++) {
    Command b=instruction.get(i);
    noFill();
    stroke(0, 100);
    strokeWeight(3);
    b.display();
  }

  //Drag icon till mouse pressed again
  if (newCommand) {
    Command b=instruction.get(instruction.size()-1);
    b.display(mouseX, mouseY);
  }

  //to remove commands for now
  if (keyPressed) {
    if (instruction.size()>0) {
      instruction.remove(instruction.size()-1);
    }
  }
}

//
void mousePressed() {
  if (newCommand) {
    Command b=instruction.get(instruction.size()-1);
    b.pos.set(mouseX, mouseY, 0);
    newCommand=false;
    if (instruction.size()==1) {
      b.posAnt.set(b.pos);
    } else {
      Command bAnt=instruction.get(instruction.size()-2);
      b.posAnt.set(bAnt.pos);
    }
  } else {//get new command from menu made explicit for easy adding more
    if (dist(mouseX, mouseY, iconXpos[0], iconYpos)<10) {
      Command b =new Command(blue1, "b=50");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[1], iconYpos)<10) {
      Command b =new Command(blue2, "b=150");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[2], iconYpos)<10) {
      Command b =new Command(blue3, "b=255");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[3], iconYpos)<10) {
      Command b =new Command(green1, "g=50");
      instruction.add(b);
      newCommand=true;
    }; 
    if (dist(mouseX, mouseY, iconXpos[4], iconYpos)<10) {
      Command b =new Command(green2, "g=150");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[5], iconYpos)<10) {
      Command b =new Command(green3, "g=255");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[6], iconYpos)<10) {
      Command b =new Command(red1, "r=50");
      instruction.add(b);
      newCommand=true;
    }; 
    if (dist(mouseX, mouseY, iconXpos[7], iconYpos)<10) {
      Command b =new Command(red2, "r=150");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[8], iconYpos)<10) {
      Command b =new Command(red3, "r=255");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[9], iconYpos)<10) {
      Command b =new Command(black, "r=g=b=0");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[10], iconYpos)<10) {
      Command b =new Command(white, "r=g=b=255");
      instruction.add(b);
      newCommand=true;
    };     
    if (dist(mouseX, mouseY, iconXpos[11], iconYpos)<10) {
      Command b =new Command(time1, "setPixel(r, g, b):time.sleep(1):r=g=b=0");
      instruction.add(b);
      newCommand=true;
    }; 
    if (dist(mouseX, mouseY, iconXpos[12], iconYpos)<10) {
      Command b =new Command(time2, "setPixel(r, g, b):time.sleep(2):r=g=b=0");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[13], iconYpos)<10) {
      Command b =new Command(time3, "setPixel(r, g, b):time.sleep(3):r=g=b=0");
      instruction.add(b);
      newCommand=true;
    };
    if (dist(mouseX, mouseY, iconXpos[14], iconYpos)<10) {
      //last option to save
      fill(255, 0, 0, 100);
      ellipse(mouseX, mouseY, 50, 50);
      saveCode();
    };
  }
}

void saveCode() {
  StringList outCode = new StringList();
  for (int j = 0; j<codeHeader.length; j++) {
    outCode.append(codeHeader[j]);
  }
  for (int i=0; i<instruction.size(); i++) {
    Command b=instruction.get(i);
    for (int l=0; l<b.code.length; l++) {
      outCode.append("    "+b.code[l]);
    }
  }
  //transfer to string array to save
  String[] outFile = new String[outCode.size()];

  for (int i = 0; i<outFile.length; i++) {
    outFile[i]=outCode.get(i);
  }
  saveStrings(mainFilePath, outFile);
}


//procedure for getting file path
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    mainFilePath=selection.getAbsolutePath();
  }
}