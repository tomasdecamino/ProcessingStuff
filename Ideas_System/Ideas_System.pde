int n=600;
PIndividual[] individual= new PIndividual[n];

void setup() {
  size(1280, 720);
  for (int i=0; i<n; i++) {
    individual[i]=new PIndividual(random(width), random(height), 0, false);
  }
  individual[0].info=1;
  individual[0].position.x=width/2;
  individual[0].position.y=height/2;
  //for (int j=1; j<20; j++) {
  //  individual[j].boss=true;
  //}
  background(255);
}

void draw() {
  //background(255);
  for (int i=0; i<n; i++) {
    stroke(0, 100);
    individual[i].display();
    for (int j=0; j<n; j++) {
      if (dist(individual[i].position.x, individual[i].position.y, individual[j].position.x, individual[j].position.y)<30) {
        if (i!=j && random(1)<=0.5) {
         //(individual[j].boss||individual[i].boss)&&
          if (individual[j].info>0)individual[i].info+=1;
        }
      }
    }
    individual[i].walk(8);
  }
  //saveFrame("frames/####.jpg");
}