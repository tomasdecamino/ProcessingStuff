int nBots =1000;
bot[] manyBots = new bot[nBots];

void setup() {
  size(displayWidth, displayHeight);
  for (int i=0;i<nBots;i++) {
    manyBots[i] = new bot(new PVector(random(0, width), random(0, height)), 5);
  }
}

void draw() {
  background(255);

  stroke(255, 29, 34, 200);
  for (int i=0;i<nBots;i++) {
    float d =dist(manyBots[i].position.x, manyBots[i].position.y, mouseX, mouseY);
    if (d<100) {
      manyBots[i].velocity.mult(-1);
    }
    manyBots[i].n=1;
    for (int j=i+1;j<nBots;j++) {
      float d2 =dist(manyBots[i].position.x, manyBots[i].position.y, manyBots[j].position.x, manyBots[j].position.y);
      strokeWeight(1);
      if (d2<100) {
        stroke(0, 0, 0, 101);
        //line(manyBots[i].position.x, manyBots[i].position.y, manyBots[j].position.x, manyBots[j].position.y);
        manyBots[i].velocity.add(manyBots[j].velocity.x*d2/50,manyBots[j].velocity.y*d2/50,0);
        manyBots[i].n++;
      }
    }

    manyBots[i].velocity.div(manyBots[i].n);
    manyBots[i].displayUpdateAlter();
    if (frameCount%100==0)manyBots[i].resetVelocity();
  }

  //if(frameCount%100==0)saveFrame("frames/####.jpg");
  //saveFrame("frames/####.jpg");
  //if (frameCount>=500)exit();
  if (keyPressed)saveFrame("frames/####.jpg");
}