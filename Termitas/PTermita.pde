class PTermita {
  PVector pos;
  PPalito miPalito;

  PTermita(float x, float y) {
    pos = new PVector(x, y, 0);
  }

  void move() {
    this.pos.add(random(-2, 2), random(-2, 2), 0);
    if (miPalito!=null) {
      miPalito.pos.set(this.pos);
    }
  }

  void display() {
    fill(255);
    ellipse(pos.x, pos.y, 10, 10);
  }

  void searchPalito() {
    for (int i=0; i<m; i++) {
      float d = pos.dist(palitos[i].pos);
      if (miPalito==null) {
        if (d<3) {
          miPalito = palitos[i];
          miPalito.taken=true;
        }
      }
    }
  }
  
    void dropPalito() {
    for (int i=0; i<m; i++) {
      float d = pos.dist(palitos[i].pos);
      if (miPalito!=null) {
        if (d<20) {
          miPalito.pos.set(palitos[i].pos);
          miPalito.pos.add(2,2,0);
          miPalito.taken=false;
          miPalito = null;
        }
      }
    }
  }
  
}
