
void setup(){
  arrow(10,10,80,30);
  
}

/*Dibuja una flecha de largo len, desde el punto x,y
con angulo ang.  Utiliza Matrix para hacerlo recto
pero trasladar el eje y rotarlo.
*/
void arrow(int x, int y, int l, float ang){
  //para determinar el largo de la punta en 45 grados
  int arrowLength = 50;
  pushMatrix();
  //cambia el eje del dibujo y lo rota
  translate(x, y);
  rotate(radians(ang));
  //dibuja una linea y flecha en el eje X
  line(0,0,l, 0);
  line(l, 0, l - arrowLength, -arrowLength);
  line(l, 0, l - arrowLength, arrowLength);
  popMatrix();
}
