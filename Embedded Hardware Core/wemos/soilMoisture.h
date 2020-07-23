#define SoilMoisturePin A0

class SoilMoistureClass {
private:
  int sm;

public:

  void begin() {
    pinMode(SoilMoisturePin, INPUT);
  }
  
  int get() {
    // read analog value and convert to meaningful range [0, 100]
    sm = analogRead(SoilMoisturePin);
    sm = constrain(sm, 485, 1023);
    sm = map(sm, 485, 1023, 100, 0);

    // return value
    return sm;
  }
};

SoilMoistureClass soilMoisture;
