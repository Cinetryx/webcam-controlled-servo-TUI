#include <Servo.h>

Servo meu_servo_1;
Servo meu_servo_2;

int indice_i; 
int indice_j;   
int pos_1 = 90;
int pos_2 = 90;



void setup() {
  
  // initialize serial:
  Serial.begin(9600);

  meu_servo_1.attach(9);
  meu_servo_2.attach(10);

}

void loop() {


  while (Serial.available() > 0) {

    // received format: "i,j,int,int"
    indice_i = Serial.parseInt();
    indice_j = Serial.parseInt();
    pos_1 = Serial.parseInt();
    pos_2 = Serial.parseInt();

    if (Serial.read() == '\n') {
        // nao faz nada
    }
  }

  meu_servo_1.write(pos_1);
  meu_servo_2.write(pos_2);

  }//fim do loop
