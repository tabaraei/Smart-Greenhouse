#include <SoftwareSerial.h>

#define RX D2
#define TX D1

SoftwareSerial serial(RX, TX);


class GSMCommand {
private:
  String command;
  
public:

  void begin() {
    serial.begin(19200);
  }

  void lookForNewCommand(int soilMoisture, float temperature, float humidity) {
    if(serial.available()) {
      command = serial.readString();
      if (command == "On") {
        irrigate.manualGSM(true);
        serial.print("Irrigation Started!");
        
      } else if (command == "Off") {
        irrigate.manualGSM(false);
        serial.print("Irrigation Stopped!");
        
      } else if (command == "Get") {
        serial.println("Temperature = " + String(temperature) + "C");
        serial.println("Humidity = " + String(humidity) + "%");
        serial.print("SoilMoisture = " + String(soilMoisture) + "%");
      }
    }
  }
};

GSMCommand gsm;
