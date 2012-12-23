int pins [] = {2,3,4,5,6,7,8,9,10,11};
int activeButton;
int nrOfButtons;
int sumOfButtons;

void setup()
{
  for (int i = 0; i < 10; i ++){
    pinMode(pins[i],INPUT);
    digitalWrite(pins[i],HIGH);
  }
  Serial.begin(9600);
}

void loop()
{
  for (int i = 0; i <10; i ++){
    if (digitalRead (pins[i]) == LOW){
      nrOfButtons++;
      sumOfButtons += i;
    } 
  }

  if ((sumOfButtons/nrOfButtons) != activeButton && (sumOfButtons/nrOfButtons) != -1){
    Serial.print(sumOfButtons/nrOfButtons);
    delay(50);
    activeButton = (sumOfButtons/nrOfButtons);  
  }
  nrOfButtons = 0;
  sumOfButtons = 0;
}
