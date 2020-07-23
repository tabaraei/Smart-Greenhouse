
#define relayActivatePin D0

class IrrigationClass {
private:
  bool previousGSMToggle, previousWiFiToggle;

public:

  void begin() {
    pinMode(relayActivatePin, OUTPUT);
    digitalWrite(relayActivatePin, HIGH);
    previousWiFiToggle = previousGSMToggle = false;
  }

  void manualApplication() {
    // read toggle value from server
    bool toggle = wifi.clientGetToggle();
    if (toggle && !previousWiFiToggle) {
      startIrrigate();
    } else if (!toggle && previousWiFiToggle) {
      stopIrrigate();
    }
    previousWiFiToggle = toggle;
  }

  void manualGSM(bool toggle) {
    // read toggle value from GSM
    if (toggle) {
      startIrrigate();
    } else if (!toggle) {
      stopIrrigate();
    }
  }

  void automatic(int soilMoisture) {
    // get threshold from server
    if(soilMoisture < wifi.clientGetThreshold()) {
      startIrrigate();
      delay(5000);
      stopIrrigate();
    } 
    // else: No automatic irrigation is needed
  }

  void startIrrigate() {
    digitalWrite(relayActivatePin, LOW);
  }

  void stopIrrigate() {
    digitalWrite(relayActivatePin, HIGH);
  }
};

IrrigationClass irrigate;
