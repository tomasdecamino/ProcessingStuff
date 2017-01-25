//Genera un arbol recursivamente
//Tom'as de Camino Beck

Branch mainBranch;
Branch tmpBranchA;
Branch tmpBranchB;
PVector origin;
PVector attractor;
float ang = radians(35);

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  origin = new PVector(width/2, height/2+10);
  attractor = new PVector(0, 0);
  mainBranch = new Branch(origin, radians(0), 1); 
  newBranch(mainBranch, 12);
 // rectMode(CENTER);
 cursor(CROSS);
}

void draw() {
  frameRate(12);
  stroke(0, 100);
  strokeWeight(2);
  smooth(8);
  //background(255);
  fill(255,120);
  rect(0,0,width,height);
  mainBranch.displayWeight(12);
  //mainBranch.display();
  attractor.set(mouseX, mouseY);
  mainBranch.shake(attractor,300);
  //mainBranch.tropism(attractor,300);  
  //mainBranch.stick(attractor);
  //mainBranch.display();
  noFill();
  strokeWeight(3);
  //ellipse(mouseX, mouseY, 400, 400);
  if (mousePressed) {
    saveFrame("frames/####.tif");
  }
}

//funcion que crea el arbol completo
void newBranch(Branch branch, int i) {
  if (i>0) {
    branch.subBranches(ang, 30);
    i-= 1;
    newBranch(branch.nextBranchA, i);
    newBranch(branch.nextBranchB, i);
  }
}
//Objecto brach
//Tom'as de Camino Beck

class Branch {
  PVector start;
  PVector end;
  PVector displace;
  Branch nextBranchA;
  Branch nextBranchB;
  float a; //angulo en rad

  Branch(PVector origin, float angle, float mag) {
    a = angle;
    start = origin;
    end = new PVector(start.x-cos(-HALF_PI+a)*mag, start.y+sin(-HALF_PI+a)*mag);
    displace = new PVector(end.x, end.y);
  }

  void display() {
    line(start.x, start.y, displace.x, displace.y);
    //rect(start.x, start.y, displace.x, displace.y);
    if (nextBranchA != null) {
      nextBranchA.display();
      nextBranchB.display();
    }
  }
  
    void displayWeight(int weight) {
    strokeWeight(weight);
    line(start.x, start.y, displace.x, displace.y);
    //rect(start.x, start.y, displace.x, displace.y);
    if (nextBranchA != null) {
      nextBranchA.displayWeight(weight-1);
      nextBranchB.displayWeight(weight-1);
    }
  }
  
  
  
    void displayPoints() {
    point(start.x, start.y);
    //rect(start.x, start.y, displace.x, displace.y);
    if (nextBranchA != null) {
      nextBranchA.displayPoints();
      nextBranchB.displayPoints();
    }
  }


  void subBranches(float angle, float mag) {
    nextBranchA = new Branch(displace, angle+a, mag);
    nextBranchB = new Branch(displace, -angle+a, mag);
  }

  // se pegan al apuntador del mouse
  void stick(PVector attractor) {
    displace.sub(attractor);
    if (displace.mag()<50) {
      displace.set(attractor);
    } 
    else {
      displace.set(end);
    }
    if (nextBranchA != null) {
      nextBranchA.stick(attractor);
      nextBranchB.stick(attractor);
    }
  }

  //las ramas cerca del mouse comienzan a vibrar    

    void shake(PVector attractor,float th) {
    displace.sub(attractor);
    if (displace.mag()<th) {
      displace.set(end);
      displace.add(random(10), random(10), 0);
    } 
    else {
      displace.set(end);
    }
    if (nextBranchA != null) {
      nextBranchA.shake(attractor,th);
      nextBranchB.shake(attractor,th);
    }
  }

// ramas se acercan a velocidad inversamente
// proporcional a la distancia del attractor

  void tropism(PVector attractor, float th) {
    displace.sub(attractor);
    float prop = 1-displace.mag()/th;
    if (displace.mag() <th) {
      displace.set(end);
      float dx = attractor.x - displace.x;
      float dy = attractor.y - displace.y;
      displace.add(dx*prop,dy*prop,0);
      
    } 
    else {
      displace.set(end);
    }
    if (nextBranchA != null) {
      nextBranchA.tropism(attractor,th);
      nextBranchB.tropism(attractor,th);
    }
  }
  
//repel atractor  
  
    void negTropism(PVector attractor,float th) {
    displace.sub(attractor);
    float prop = 1-displace.mag()/th;
    if (displace.mag() <th) {
      displace.set(end);
      float dx = attractor.x - displace.x;
      float dy = attractor.y - displace.y;
      displace.sub(dx*prop,dy*prop,0);
      
    } 
    else {
      displace.set(end);
    }
    if (nextBranchA != null) {
      nextBranchA.negTropism(attractor,th);
      nextBranchB.negTropism(attractor,th);
    }
  }
  
}


