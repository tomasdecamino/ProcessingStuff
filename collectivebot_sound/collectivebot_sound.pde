import ddf.minim.*;

int nBots =500;
bot[] manyBots = new bot[nBots];
Minim minim;
AudioPlayer player;

void setup() {
  minim = new Minim(this);
  size(displayWidth, displayHeight);

  player = minim.loadFile("flashforge1_ruedas.mp3");
  player.play();
  for (int i=0;i<nBots;i++) {
    manyBots[i] = new bot(new PVector(random(0, width), random(0, height)), 5);
  }
  player.play();
}

void draw() {
 // background(255);
  noStroke();
  fill(255,40);
  rect(0,0,width,height);
  float total =0;
  for(int i=0;i<player.bufferSize();i++){
    total+=abs(player.right.get(i));
  }
  for (int i=0;i<nBots;i++) {
    /* float d =dist(manyBots[i].position.x, manyBots[i].position.y, mouseX, mouseY);
     if (d<100) {
     manyBots[i].velocity.mult(-1);
     }*/
    manyBots[i].n=1;
   // manyBots[i].velocity.add(player.left.get(i)*10, player.right.get(i)*10, 0);
    for (int j=i+1;j<nBots;j++) {
      float d2 =dist(manyBots[i].position.x, manyBots[i].position.y, manyBots[j].position.x, manyBots[j].position.y);
      strokeWeight(2);
      if (d2<total/5) {
        stroke(40,100);
        line(manyBots[i].position.x, manyBots[i].position.y, manyBots[j].position.x, manyBots[j].position.y);
        manyBots[i].velocity.add(manyBots[j].velocity.x*d2/50, manyBots[j].velocity.y*d2/50, 0);
        manyBots[i].n++;
      }
    }
    //manyBots[i].position.x+=player.left.get(i)*10;
    //manyBots[i].position.y+=player.right.get(i)*10;
    manyBots[i].velocity.div(manyBots[i].n);
    manyBots[i].displayUpdateAlter();
    // if (frameCount%100==0)manyBots[i].resetVelocity();
  }

  //if(frameCount%100==0)saveFrame("frames/####.jpg");
  //saveFrame("frames/####.jpg");
  //if (frameCount>=500)exit();
  println(player.length());
  if(player.position()>player.length())exit();
  if (keyPressed)saveFrame("frames/####.jpg");
}

