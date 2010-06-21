#include <Ethernet.h>

byte mac[] = { 0xDE, 0xAD, 0xBE, 0xEF, 0xFE, 0xED };
byte ip[] = { 10, 0, 0, 177 };
int ledPin =  13;    // LED to make blink

Server server(80);

//new line here

void setup()
{
  Ethernet.begin(mac, ip);
  server.begin();

  pinMode(ledPin, OUTPUT);     

  }


void loop()
{
	// Turn the LED on ... nice to see something is working.
  	digitalWrite(ledPin, HIGH);   // set the LED on

	  Client client = server.available();

	  if (client) {
	    // an http request ends with a blank line
	    boolean current_line_is_blank = true;
	    while (client.connected()) {
	      if (client.available()) {
		char c = client.read();
		// if we've gotten to the end of the line (received a newline
		// character) and the line is blank, the http request has ended,
		// so we can send a reply
		if (c == '\n' && current_line_is_blank) {
		  // send a standard http response header

		  // HTTP header
		  client.println("HTTP/1.1 200 OK");
		  //TODO client.println("Content-Type: text/html");
		  client.println("Content-Type: text/plain");
		  client.println();
		  
		  // output the value of each analog input pin
		  	client.println("off");
		  }
		  break;
		}
		if (c == '\n') {
		  // we're starting a new line
		  current_line_is_blank = true;
		} else if (c != '\r') {
		  // we've gotten a character on the current line
		  current_line_is_blank = false;
		}
	      }
	    }
	    // give the web browser time to receive the data
	    delay(1000);
	    client.stop();
		
	  }
}

