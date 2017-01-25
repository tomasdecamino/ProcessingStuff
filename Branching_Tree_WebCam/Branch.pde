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

    void shake(PVector attractor) {
    displace.sub(attractor);
    if (displace.mag()<180) {
      displace.set(end);
      displace.add(random(10), random(10), 0);
    } 
    else {
      displace.set(end);
    }
    if (nextBranchA != null) {
      nextBranchA.shake(attractor);
      nextBranchB.shake(attractor);
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

