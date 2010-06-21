int ledPin = 13;    	// LED to blink
		        // This may be built in for your board.

void setup()
{
  // Pin 9 will be for output not INPUT.
  pinMode(ledPin, OUTPUT);     
}


void loop()
{

 	// Turn the LED on
 	digitalWrite(ledPin, HIGH);   // set the LED on

	//delay pauses the program for the amount of time (in miliseconds) specified as parameter. (There are 1000 milliseconds in a second.)
  	delay(1000);

	digitalWrite(ledPin, LOW);   // set the LED off
	delay(1000);
 
}


