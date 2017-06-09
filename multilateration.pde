import processing.serial.*;
 
import org.apache.commons.math3.linear.ArrayRealVector;
import org.apache.commons.math3.linear.DiagonalMatrix;
 
 
Serial myPort;  // The serial port
int maxNumberOfSensors = 4;  
float[] sensorValues = new float[maxNumberOfSensors];
float sensorValueX;
float sensorValueX1;
float sensorValueY;
float sensorValueY1;
int scaleValue = 2;
 
 
PVector trilateration(Sensor s1, Sensor s2, Sensor s3) {
    PVector s = PVector.sub(s2.p, s1.p).div(PVector.sub(s2.p, s1.p).mag());
    float a = s.dot(PVector.sub(s3.p, s1.p));
 
    PVector t = PVector.sub(s3.p, s1.p).sub(PVector.mult(s, a)).div(PVector.sub(s3.p, s1.p).sub(PVector.mult(s, a)).mag());
    float b = t.dot(PVector.sub(s3.p, s1.p));
    float c = PVector.sub(s2.p, s1.p).mag();
    
    
 
    float x = (sq(s1.d) - sq(s2.d) + sq(c)) / (c * 2);
    float y = ((sq(s1.d) - sq(s3.d) + sq(a) + sq(b)) / (b * 2)) - ((a / b) * x);
 
    s.mult(x);
    t.mult(y);
 
    return PVector.add(s1.p, s).add(t);
}
 
 
void setup () {
  size(600, 600);  // set up the window to whatever size you want
  //println(Serial.list());  // List all the available serial ports
  String portName = "COM5";
  myPort = new Serial(this, portName, 9600);
  myPort.clear();
  myPort.bufferUntil('\n');  // don't generate a serialEvent() until you get a newline (\n) byte
  background(255);    // set inital background
  smooth();  // turn on antialiasing
}
 
class Sensor {
    public PVector p; // position
    public float d; // distance from sensor to target (radius of the circle)
 
    public Sensor(float x, float y, float d) {
        this.p = new PVector(x, y);
        this.d = d;
    }
}
 
void draw () {
  background(255);
  noFill();
  fill(100,100,100,100);
  Sensor s1 = new Sensor(height,0, scaleValue*sensorValues[0]);
  Sensor s2 = new Sensor(0,width,scaleValue*sensorValues[1]);
  Sensor s3 = new Sensor(height, width, scaleValue*sensorValues[3]);
  Sensor s4 = new Sensor(0, 0, scaleValue*sensorValues[3]);
  
  ellipse(height,0, scaleValue*sensorValues[0], scaleValue*sensorValues[0]);
  ellipse(0,width, scaleValue*sensorValues[1], scaleValue*sensorValues[1]);
  ellipse(height,width, scaleValue*sensorValues[2], scaleValue*sensorValues[2]);
  ellipse(0,0, scaleValue*sensorValues[3], scaleValue*sensorValues[3]);
  
  ellipse(sensorValueY, sensorValueX, 10,10);
  println(sensorValueY,sensorValueX);
 
  PVector target = trilateration(s1, s2, s3);
  ellipse(abs(target.x), abs(target.y), 10,10);
  println(target.x + " " + target.y);
  
  sensorValueX = ((sensorValues[2]*sensorValues[1])-(sensorValues[1]*sensorValues[1])+600*600)/2000;
  
  
  
  sensorValueX = ((sensorValues[3]*sensorValues[3])-(sensorValues[2]*sensorValues[2])+600*600)/2000;
  sensorValueX1 = ((sensorValues[0]*sensorValues[0])-(sensorValues[1]*sensorValues[1])+600*600)/2000;
  sensorValueY = ((sensorValues[3]*sensorValues[3])-(sensorValues[2]*sensorValues[2])+(600*600))/2000;
  sensorValueY1 = ((sensorValues[1]*sensorValues[1])-(sensorValues[0]*sensorValues[0])+(600*600))/2000;
  
  line(0, scaleValue*sensorValueX, height,scaleValue* sensorValueX);
  line(scaleValue*sensorValueY, 0, scaleValue*sensorValueY, width);
  ellipse(scaleValue*sensorValueY, scaleValue*sensorValueX, 20,20);
  line(0, scaleValue*sensorValueX1, height,scaleValue* sensorValueX1);
  line(scaleValue*sensorValueY1, 0, scaleValue*sensorValueY1, width);
  ellipse(scaleValue*sensorValueY1, scaleValue*sensorValueX1, 20,20);
  println(scaleValue*sensorValueX,scaleValue*sensorValueY);
   
}
 
 
void serialEvent (Serial myPort) {
  String inString = myPort.readStringUntil('\n');  // get the ASCII string
 
  if (inString != null) {  
    inString = trim(inString);  
    int incomingValues[] = int(split(inString, ","));  // convert to an array of ints
 
    if (incomingValues.length <= maxNumberOfSensors && incomingValues.length > 0) {
      for (int i = 0; i < incomingValues.length; i++) {
        // map the incoming values (0 to  1023) to an appropriate gray-scale range (0-255):
       
        sensorValues[i] = map(incomingValues[i], 0, 1023, 0, width);
        //println(incomingValues[i]+ " " + sensorValues[i]);
      }
    }
  }
