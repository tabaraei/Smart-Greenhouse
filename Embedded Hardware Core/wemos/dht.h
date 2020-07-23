#include <DHT.h>
#define DHTTYPE DHT11
#define DHTPin D3
DHT DH(DHTPin, DHTTYPE);

class DHTClass {
private:
  float temperature, humidity;

public:

  void begin() {
    DH.begin();
  }

  float getTemperature() {
    // read digital pin value
    temperature = DH.readTemperature();

    // return value
    if (isnan(temperature)) return 0;
    else return temperature;
  }
  
  float getHumidity() {
    // read digital pin value
    humidity = DH.readHumidity();

    // return value
    if (isnan(humidity)) return 0;
    else return humidity;
  }
};

DHTClass dht;
