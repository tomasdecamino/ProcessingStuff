//@author: Tomas de Camino BEck

import processing.serial.*;//carga libreria serial
Serial port;//crea una variable (objeto) para puerto

// magnitude [0] and angle in radians [1]
int n=2; //numero de variables que env'ia el arduino separadas por coma
float[] data = new float[n];

void setup()
{
  size(700, 700);
  println(Serial.list());//ver e que puerto esta el arduino
  port = new Serial(this, Serial.list()[5], 9600);//crea e puerto 9600 debe ser igaul en Arduino
  port.bufferUntil('\n');

}

void draw()
{
  //hacer algo con los datos
  //p.e. data[0],data[1] contiene coordenadas x y y
  //que vienen del arduino
  ellipse(data[0],data[1],100,100)

 
}

//funcion que corre sola cada vez que entra informaci'on
//por el puerto serial
void serialEvent(Serial port) {
  String bufString = port.readString();
  data = float(split(bufString,','));
}

