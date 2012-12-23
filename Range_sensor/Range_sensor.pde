/*
  AnalogReadSerial
 Reads an analog input on pin 0, prints the result to the serial monitor 
 
 This example code is in the public domain.
 */
//int min = 0;

void setup() {
  Serial.begin(9600);
}

void loop() {
  int sensorValue = analogRead(A0);
  //if (sensorValue > min) min = sensorValue;
  //Serial.println(min);
  Serial.print(map(sensorValue, 100, 900, 0, 9), DEC);
  delay(20);
}
