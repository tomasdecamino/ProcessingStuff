void setup(){
 size(displayWidth,displayHeight);
 
  
}

void draw(){
 background(0);
 noFill();
 strokeWeight(3);
 stroke(255);
 ellipse(width/2,height/2,500,500);
 fill(255);
 ellipse(width/2,height/2,frameCount%100,frameCount%100);
 saveFrame("frames/####.jpg");
}
