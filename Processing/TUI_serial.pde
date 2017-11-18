// import the TUIO library
import TUIO.*;
// declare a TuioProcessing client
TuioProcessing tuioClient;

import processing.serial.*;

Serial myPort;

int angulo_servo_1 = 1;
int angulo_servo_2 = 1;


void setup() {
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
  size(200, 200);

  // we create an instance of the TuioProcessing client
  // since we add "this" class as an argument the TuioProcessing class expects
  // an implementation of the TUIO callback methods in this class (see below)
  tuioClient = new TuioProcessing(this);

  background(0);
  smooth();
  rectMode(CENTER);
}


void draw() {

  myPort.write(0 + "," + 1 + "," + angulo_servo_1 + "," + angulo_servo_2 + "," + "\n");
  println(0 + "," + 1 + "," + angulo_servo_1 + "," + angulo_servo_2 + "," + "\n");

  angulo_servo_1 += 5;

  if (angulo_servo_1 >=180)
  {
    angulo_servo_1= 0;
  }

  delay(20);
}

// called when an object is moved
void updateTuioObject (TuioObject tobj) {

  angulo_servo_2 = round( degrees( tobj.getAngle() ) /2);

}
