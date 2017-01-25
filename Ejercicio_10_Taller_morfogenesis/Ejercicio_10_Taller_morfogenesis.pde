PImage foto;

void setup(){
  foto = loadImage("https://pbs.twimg.com/profile_images/378800000704989843/ea93c5c74cf838be57e6770d67b1dedb.jpeg");
  size(foto.width,foto.height);  
}

void draw(){
  background(255);
  //image(foto,0,0);
  for(int i=0;i<foto.width;i+=10){
    for(int j=0; j<foto.height;j+=10){
      color c = foto.get(i,j);
      fill(c);
      noStroke();
      float r=random(3,10);
      rect(i,j,r,r);
      
    }//for j
  }//for i
 // saveFrame("frames/####.jpg");
  
}//draw
