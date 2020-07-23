#include <SD.h>
#include <SPI.h>
#define CSPin D8

class SDCardClass {
private:
    String logString, currentTime;
    File myFile;

public:

  void begin() {
    SD.begin(CSPin);
  }

  void logValues(int soilMoisture, float temperature, float humidity) {
    // create log data
    logString = "soilMoisture: " + String(soilMoisture) + ", "
              + "temperature: " + String(temperature) + ", "
              + "humidity: " + String(humidity);
  
    // open sd card to log data
    myFile = SD.open("log.txt", FILE_WRITE);
    if (myFile) {
      myFile.println(logString);
      myFile.close();
    }
    // else: failed
  }
  
};

SDCardClass sdCard;
  
  
