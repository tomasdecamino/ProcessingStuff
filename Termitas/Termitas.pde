
int n =20;
int m = 400;
PTermita[] termitas = new PTermita[n];
PPalito[] palitos = new PPalito[m];

void setup() {
  size(600, 600);
  for (int i=0; i<n; i++) {
    termitas[i] = new PTermita(random(width), random(height));
  }
  for (int j=0; j<m; j++) {
    palitos[j] = new PPalito(random(width), random(height));
  }
}

void draw() {
  background(0);
  for (int i=0; i<n; i++) {
    termitas[i].display();
    termitas[i].move();
    termitas[i].dropPalito();
    termitas[i].searchPalito();
    
    
  }

  for (int j=0; j<m; j++) {
    palitos[j].display();
  }
}
