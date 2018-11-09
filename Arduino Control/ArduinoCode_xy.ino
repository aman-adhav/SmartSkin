#define side1 2
#define side2 3
#define side3 4
#define side4 5
#define contact A0
 
void setup() {
  pinMode(contact, INPUT); 
  pinMode(side1, OUTPUT);  
  pinMode(side2, OUTPUT);  
  pinMode(side3, OUTPUT);  
  pinMode(side4, OUTPUT);  
  Serial.begin(9600);
}
 
void loop() {
 
  // SENSOR VALUE 1:
  digitalWrite(side1, LOW);
  digitalWrite(side2, HIGH);
  digitalWrite(side3, HIGH);
  digitalWrite(side4, HIGH);
  delay(10);
  int sensorValue1 = analogRead(contact);
 
  // SENSOR VALUE 2:
  digitalWrite(side2, LOW);
  digitalWrite(side3, HIGH);
  digitalWrite(side4, HIGH);
  digitalWrite(side1, HIGH);
  delay(10);
  int sensorValue2 = analogRead(contact);
 
 
  // SENSOR VALUE 3:
  digitalWrite(side3, LOW);
  digitalWrite(side2, HIGH);
  digitalWrite(side4, HIGH);
  digitalWrite(side1, HIGH);
  delay(10);
  int sensorValue3 = analogRead(contact);
 
 
  // SENSOR VALUE 2:
  digitalWrite(side4, LOW);
  digitalWrite(side3, HIGH);
  digitalWrite(side2, HIGH);  
  digitalWrite(side1, HIGH);
  delay(10);
  int sensorValue4 = analogRead(contact);
 
  Serial.print(sensorValue1);
  Serial.print(",");
  Serial.print(sensorValue2);
  Serial.print(",");
  Serial.print(sensorValue3);
  Serial.print(",");
  Serial.print(sensorValue4);
  Serial.println();
 
  
  int sidexone = 0;
  int sideyone = 0;
  int sidexthree = 0;
  int sideytwo= 0;
  int sidextwo = 1000;
  int sidexfour = 1000;
  int sideyfour = 1000;
  int sideythree= 1000;
  
  int a  = (-1*(2)*sidexone)+(2*sidextwo);
  int b = ((-1*2*sideyone)+2*sideytwo);
  int c = (sensorValue1 * sensorValue1)- (sensorValue2 * sensorValue2)-(sidexone*sidexone)+(sidextwo*sidextwo)-(sideyone*sideyone)+(sideytwo*sideytwo);
  int d  = (-1*2*sidextwo)+(2*sidexthree);
  int e = ((-1*2*sideytwo)+2*sideythree);
  int f = (sensorValue2 * sensorValue2)- (sensorValue3 * sensorValue3)-(sidextwo*sidextwo)+(sidexthree*sidexthree)-(sideytwo*sideytwo)+(sideythree*sideythree);
 
  int g  = (−2*x2+2*x4);
  int h = (−2*sideytwo+2*y4);
  int i = (sensorValue2 * sensorValue2)- (sensorValue4 * sensorValue4)-(x2*x2)+(x4*x4)-(y4*y4)+(y4*y4); 
 
  int x = ((c*d)-(f*a))/((b*d)-(e*a));
  int y = ((a*e)-(d*b))/((c*e)-(f*b));
 
  Serial.print(a);
  Serial.print("a + ");
  Serial.print(b);
  Serial.print("b + ");
  Serial.print(c);
  Serial.print("c + ");
  Serial.print(d);
  Serial.print("d + ");
  Serial.print(e);
  Serial.print("e + ");
  Serial.print(f);
  Serial.println("f");
}

#define sideX 2  
#define sideX1 3  
#define sideY 4  
#define sideY1 5  
#define contact A0
 
void setup() {
  pinMode(contact, INPUT); 
  Serial.begin(9600);
}
 
void loop() {
  // READ X-direction:
  pinMode(sideX, OUTPUT);  
  digitalWrite(sideX, LOW);
  pinMode(sideY, OUTPUT);  
  digitalWrite(sideY, HIGH);
  pinMode(sideX1, INPUT);  
  pinMode(sideY1, INPUT);  
  delay(10);
  int sensorValueX = analogRead(contact);
 
  // READ Y-direction:
  pinMode(sideY1, OUTPUT);  
  digitalWrite(sideY1, LOW);
  pinMode(sideX1, OUTPUT);  
  digitalWrite(sideX1, HIGH);
  pinMode(sideX, INPUT);  
  pinMode(sideY, INPUT);  
  delay(10);
  int sensorValueY = analogRead(contact);
 
  Serial.print(sensorValueX);
  Serial.print(",");
  Serial.print(sensorValueY);
  Serial.println();
}
