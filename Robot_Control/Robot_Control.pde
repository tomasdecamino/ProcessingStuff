/* @author: Tomas de Camino Beck
 @version: 1.0 Jan 2016
 www.inventoria.org
 Hecho en Costa Rica
 */

import processing.serial.*;
Serial port;

//load button images
PImage imgR, imgL, imgU, imgD;
PImage imgNote;
PImage imgCO, imgCC;
PImage img2;
PImage backimg;
PImage eraseimg;

//State variable
boolean newButton=false;
//size of the buttons
int s=100;
//Array that contains a list of Button objects (instructions)
ArrayList<button> instruction = new ArrayList<button>();

void setup() {
  //load images
  imgR = loadImage("arrowR.png");
  imgL = loadImage("arrowL.png");
  imgU = loadImage("arrowU.png");
  imgD = loadImage("arrowD.png");

  imgCO = loadImage("clawO.png");
  imgCC = loadImage("clawC.png");


  imgNote = loadImage("note.png");

  img2 = loadImage("play.png");
  backimg = loadImage("paper.jpg");
  eraseimg = loadImage("erase.png");   
  size(1000, 600);
  imageMode(CENTER);
  textSize(26);
  textAlign(CENTER);
  //Serial to bluetooth
  println(Serial.list());
  port = new Serial(this, "/dev/cu.HC-06-DevB", 9600);
}

void draw() {
  background(255);
  // image(backimg, width/2, height/2);
  drawBaseButtons();
  //uses state variable to display drag button
  if (newButton) {
    button b=instruction.get(instruction.size()-1);
    b.display(mouseX, mouseY);
  }
  //Draws the buttons (instructions) in the array
  for (int i=0; i<instruction.size(); i++) {
    button b=instruction.get(i);
    strokeWeight(6);
    stroke(0, 100);
    noFill();
    b.display();
    text(i+1, b.pos.x-5, b.pos.y+10);
  }
}

//arranging the display
void drawBaseButtons() {
  fill(240, 150);
  rect(0, 0, width-1, 124);
  //button left
  pushMatrix();
  translate(60, 60);
  image(imgL, 0, 0, s, s);
  popMatrix();
  //button rigth
  pushMatrix();
  translate(s+70, 60);
  image(imgR, 0, 0, s, s);
  popMatrix();
  //button UP
  pushMatrix();
  translate(2*s+70, 60);
  image(imgU, 0, 0, s, s);
  popMatrix();
  //button Down
  pushMatrix();
  translate(3*s+70, 60);
  image(imgD, 0, 0, s, s);
  popMatrix();

  //clawO
  pushMatrix();
  translate(4*s+70, 60);
  image(imgCO, 0, 0, s, s);
  popMatrix();

  //clawC
  pushMatrix();
  translate(5*s+70, 60);
  image(imgCC, 0, 0, s, s);
  popMatrix();

  //note
  pushMatrix();
  translate(6*s+70, 60);
  image(imgNote, 0, 0, s, s);
  popMatrix();

  //Play button   
  image(img2, width-60, 60, 100, 100);
  image(eraseimg, width-60, height-60, 100, 100);
}

void mousePressed() 
  //Chacks if the button its being dragged or placed in new
  //position. Check for button clicks
{
  if (!newButton) {
    if (mouseY<124) {
      if (mouseX<115) {
        button b =new button('L', imgL);
        instruction.add(b);
        newButton=true;
      }
      if (mouseX>115 && mouseX<221) {
        button b =new button('R', imgR);
        instruction.add(b);
        newButton=true;
      }
      if (mouseX>221 && mouseX<321) {
        button b =new button('F', imgU);
        instruction.add(b);
        newButton=true;
      }
      if (mouseX>321 && mouseX<421) {
        button b =new button('B', imgD);
        instruction.add(b);
        newButton=true;
      }
      if (mouseX>421 && mouseX<521) {
        button b =new button('O', imgCO);
        instruction.add(b);
        newButton=true;
      } 
      if (mouseX>521 && mouseX<621) {
        button b =new button('C', imgCC);
        instruction.add(b);
        newButton=true;
      } 
      if (mouseX>621 && mouseX<721) {
        button b =new button('N', imgNote);
        instruction.add(b);
        newButton=true;
      } 
      if (mouseX>width-120) {
        executeIntructions();
      }
    }
  } else {
    button b=instruction.get(instruction.size()-1);
    println(b);
    b.pos.set(mouseX, mouseY, 0);
    newButton=false;
    if (instruction.size()==1) {
      b.posAnt.set(b.pos);
    } else {
      button bAnt=instruction.get(instruction.size()-2);
      b.posAnt.set(bAnt.pos);
    }
  }
  if (mouseX>width-120&& mouseY>height-120) {
    if (instruction.size()>0) {
      instruction.remove(instruction.size()-1);
    }
  }
}

void executeIntructions() {
  //creates commands and sends them to serial
  String cmd="";
  for (int i=0; i<instruction.size(); i++) {
    button b=instruction.get(i);
    cmd+=b.type;
  }
  cmd+="/n";
  println(cmd);
  port.write(cmd);
}