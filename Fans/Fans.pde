long int timer;
int time = 2000; // 2 secs the first time
int timeOn = 5000;
int timeOff = 10000;
int value = 0;
boolean fanState = false;


void setup() {
  Serial.begin(9600);
  /*Serial.println("Im awake");
  Serial.println();
  Serial.println("Syntax:");
  Serial.println(" 123a : set on time to 123 milliseconds");
  Serial.println(" 123b : set off time to 123 milliseconds");
  */
  
  pinMode(2, OUTPUT);
  pinMode(3, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);
}


void loop() {

  int c;

  while(Serial.available()){
  c = Serial.read();
  if ((c>='0') && (c<='9')) {
    value = 10*value + c - '0';
    //Serial.println("avalible");
  } 
  else {
    if (c=='a') timeOn = value;
    else if (c=='b') timeOff = value;
    value = 0;
  }
  }
  
  // timer stuff here
  if(millis() - timer > time){
    timer = millis(); // timer stuff
    fanState = !fanState; // change the state to oposite value (true / false) 
    digitalWrite(2, fanState); // setting fan
    digitalWrite(3, fanState);
    digitalWrite(6, fanState);
    digitalWrite(7, fanState);
    
    /*if (fanState) Serial.print("on | ");
    else Serial.println("off ");
    Serial.print("timeOn: ");
    Serial.println(timeOn);
    Serial.print("timeOff: ");
    Serial.println(timeOff);
    */
    
    if (fanState) { // if fan on
      time = timeOff; // time to next timer triggering
    }
    else { // else its off
      time = timeOn; // time to next timer triggering
    }
  }
}

