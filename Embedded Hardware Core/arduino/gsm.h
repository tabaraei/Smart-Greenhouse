#include <SoftwareSerial.h>

// Serial pins for communicating with GSM
#define GSM_RX 12
#define GSM_TX 13

SoftwareSerial gsmSerial(GSM_RX, GSM_TX);


class SIM808 {
private:
  String command;

public:

  void begin() {
    gsmSerial.begin(19200);
  }

  void readNewMessage() {
    gsmSerial.println("AT+CNMI=2,1,0,0;+CMGF=1\r\n"); // save inside simcard, and switch to text mode
    updateSerial();
    gsmSerial.println("AT+CMGR=1,1"); // read message & remain unread
    this->command = updateSerial();
    gsmSerial.println("AT+CMGDA=\"DEL ALL\"");
    updateSerial();
  }

  void sendMessage(String text, String number) {
    gsmSerial.println("AT+CSMP=17,167,0,0");
    updateSerial();
  
    gsmSerial.print(F("AT+CMGS=\""));
    gsmSerial.print(number);
    gsmSerial.print(F("\"\r"));
    updateSerial();
  
    gsmSerial.print(text);
    updateSerial();
  
    gsmSerial.print((char)26);
  }

  String getNumber() {
    return this->command.substring(35,48);
  }

  String getCommand() {
    String cmd = this->command.substring(77, 80);
    if (cmd.indexOf("on") >= 0) return "On";
    else if (cmd.indexOf("off") >= 0) return "Off";
    else if (cmd.indexOf("get") >= 0) return "Get";
    else return "Not Found";
  }

  String updateSerial() {
    int timeout = 0;
    while(!gsmSerial.available() && timeout < 2000) {
      delay(15);
      timeout++;
    }
    if(gsmSerial.available()) {
      return gsmSerial.readString();
    }
  }
};

SIM808 gsm;
