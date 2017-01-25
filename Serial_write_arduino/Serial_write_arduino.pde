/* @author tomas de camino beck
 @version 1.0
 @date april 2014*/

import processing.serial.*;
Serial port;

void setup() {
    port = new Serial(this, "COM3", 9600);//cambiar el n[umero de puerto
    
}

void draw(){
  //envía un char al arduino que puede ser leido directamente en el arduino
  //usar differentes char para ejecutar diferentes funciones en el arduino
  port.write('0');//envia char para el arduino 
}