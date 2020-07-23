#include <SoftwareSerial.h>

// Serial pins for communicating with wemos
#define Wemos_RX 10
#define Wemos_TX 11

SoftwareSerial wemosSerial(Wemos_RX, Wemos_TX);


class WemosSerial {
public:

  String runCommand(String command) {
    wemosSerial.begin(19200);
    wemosSerial.print(command);
    return updateSerial();
  }

  String updateSerial() {
    int timeout = 0;
    while(!wemosSerial.available() && timeout < 2000) {
      delay(15);
      timeout++;
    }
    if(wemosSerial.available()) {
      return wemosSerial.readString();
    }
  }
  
};

WemosSerial serial;
