/* @author tomas de camino beck
 @version 1.0
 @date april 2014*/

import processing.serial.*;
Serial port;

//serial data
char data='0';

PFont font;
PImage img;
//margins and roundness
int mX=150;
int mY=150;
int roundC=50;
//to determine click
int buttonState=-1;
long smillis; //debounce
long lastMillis; //wait for mouse input
//array for color sequence and level
int levels = 200;
int[] randomSeq = new int[levels];
int level =1;
//state waits
boolean waitInput = false;//after sequence wait for input
boolean waitStart = true;
boolean waitVoice = true;
boolean endGame = false;
int mouseCount = 1;
//counts
int count = 0;
int maxCount = 1;
int inputCount =0;
//keep the score
int score =0;

void setup() {
  size(displayWidth, displayHeight);
  rectMode(CORNER);
  smooth();
  font = loadFont("Computerfont-148.vlw");
  textFont(font, 100);
  textAlign(CENTER);
  displayButtons();
  loadPixels();
  setSeq();
  img = loadImage("pointer.png");
  //cursor(img);
  println(Serial.list());
  port = new Serial(this, "COM15", 9600);
  port.clear();
  port.write('0');
}

void draw() {
  background(0);
  displayButtons();
  /************* BEGINING OF GAME *************/
  if (!endGame) {
    //checks for de sensor to detect somebody
    if (waitStart) {
      frameRate(30);
      fill(255);
      background(0);
      textFont(font, 100);
      text("Esperando...", width/2, height/2 );
      data=port.readChar();
      waitStart= data!='1';//'1' indicates someone present
      println(data);
    }

    //Now waits for the person to scream
    else {
      if (waitVoice) {
        fill(255);
        background(0);
        textFont(font, 130);
        text("Grita!", width/2, height/2 );
        data=port.readChar();
        waitStart= data=='0';
        println(data);
        text(data, width/2, height/2+200);
        meter(width/2-200, height/2-200, charInt(data), 4);
        waitVoice=data!='9';
        if (!waitVoice) {
          frameRate(0.2);
          background(0);
          fill(255);
          text("Comienza Juego", width/2, height/2);
          port.clear();
        }
      }
      /************* GAME **************/
      else {
        //game ends if score is 6 or there are 10 sequences
        if (score==6||maxCount==10) {
          endGame=true;
        }
        // if the sequence get to maxcout then wait for input
        if (count ==maxCount) {
          waitInput = true;
          count = 0;
          frameRate(4);
          maxCount++;
          smillis=millis();
          lastMillis=millis();
        }
        //show the sequence to the participant
        if (!waitInput) {
          background(0);
          frameRate(0.8);
          fill(255);
          text("Simon Says", width/2, 100);
          drawButton(randomSeq[count], true);
          //println(mouseX);
          //text(randomSeq[count], 50, 50);
          count++;
        }
        //start de mouse input sequence
        else {
          // println(mouseEvent);
          //wait for input for a while

            //if there is no activity then go to begining

          if (millis()-lastMillis>20000) {
            waitInput = false;
            waitStart = true;
            waitVoice = true;
            port.write('0');
            count = 0;
            maxCount = 1;
            inputCount =0;
            setSeq();
            frameRate(30);
            score=0;
            //port.clear();
          }
        }
      }
    }
  }
  /********** GAME OVER ************************/
  else {
    frameRate(0.3);
    background(0);
    waitInput = false;
    waitStart = true;
    waitVoice = true;
    count = 0;
    maxCount = 1;
    inputCount =0;
    setSeq();
    fill(255);
    textFont(font, 148);
    if (score==6) {
      text("Ganaste!", width/2, height/2-60);
      text("Recoje tu premio", width/2, height/2+60);
      port.write('1');
    }
    else {
      text("Perdiste!", width/2, height/2);
      port.write('0');
    }
    score = 0;
    endGame=false;
  }
}

void displayButtons() {
  drawButton(0, false);
  drawButton(1, false);
  drawButton(2, false);
  drawButton(3, false);
}

void drawButton(int quad, boolean h) {
  noStroke();
  int o = 150;
  if (h) o = 255;
  switch(quad) {
  case 0: 
    fill(color(255, 255, 0), o);
    rect(mX, mY, width/2-mX, height/2-mY, roundC);
    break;
  case 1: 
    fill(color(255, 0, 0), o);
    rect(width/2, mY, width/2-mX, height/2-mY, roundC);
    break;
  case 2: 
    fill(color(0, 255, 0), o);
    rect(mX, height/2, width/2-mX, height/2-mY, roundC);
    break;
  case 3: 
    fill(color(0, 0, 255), o);
    rect(width/2, height/2, width/2-mX, height/2-mY, roundC);
    break;
  }
}

int buttonClick() {
  int c = pixels[mouseY*width+mouseX];
  if (c==-1381804) {
    buttonState = 0;
    drawButton(0, true);
  }
  else if (red(c)>230 ) {
    buttonState = 1;
    drawButton(1, true);
  }
  else if (green(c)>230 ) {
    buttonState = 2;
    drawButton(2, true);
  }
  else if (blue(c)>230 ) {
    buttonState = 3;
    drawButton(3, true);
  } 
  else {
    buttonState = -1;
  }
  //println(c);
  return buttonState;
}

//draw the scale
void meter(int x, int y, int l, float s) {
  pushMatrix();
  translate(x, y);
  scale(s);
  fill(0, 255, 0);
  stroke(255);
  for (int i=0;i<l;i++) {
    rect(i*10, 0, 10, 20);
  }
  popMatrix();
}


//start a random sequence with no consecutive numbers
void setSeq() {
  int rand = (int)random(4);
  randomSeq[0]=rand;
  for (int i=1; i<levels;i++) {
    rand = (int)random(4);
    while (rand==randomSeq[i-1]) rand = (int)random(4);
    randomSeq[i]=rand;
  }
}

//Change char to int
int charInt(char a) {
  switch(a) {
  case '1': 
    return 1;  
  case '2': 
    return 2;
  case '3': 
    return 3;
  case '4': 
    return 4;
  case '5': 
    return 5;
  case '6': 
    return 6;
  case '7': 
    return 7;
  case '8': 
    return 8;
  case '9': 
    return 9;
  default: 
    return 0;
  }
}

void mouseReleased() {

  if (millis()-smillis>500) {
    lastMillis=millis();
    mouseCount++;
    if (buttonClick()==randomSeq[inputCount]) {
      score++;
    }
    inputCount++;
    waitInput=(inputCount!=(maxCount-1));
    if (!waitInput) {
      fill(255);
      text("puntos:", width/2-200, 100);
      text(score, width/2+100, 100);
      inputCount=0;
      smillis=millis();
      frameRate(0.4);
    }
  }

  println(mouseEvent.getButton());
}

