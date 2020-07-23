#include <LiquidCrystal.h>

#define Rs 9
#define EN 8
#define D4 7
#define D5 6
#define D6 5
#define D7 4
#define BackLight 3

LiquidCrystal myLCD(Rs, EN, D4, D5, D6, D7);

class LCD {
public:

  void begin() {
    pinMode(BackLight, OUTPUT);
    digitalWrite(BackLight, HIGH);
    myLCD.begin(16, 2);
    myLCD.clear();
  }

  void print(String str, int row) {
    myLCD.setCursor((16 - str.length())/2, row);
    myLCD.print(str);
  }

  void clear() {
    myLCD.clear();
  }

  void sleep() {
    myLCD.clear();
    myLCD.setCursor(0, 0);
    myLCD.print("Going to Sleep!");
    myLCD.setCursor(4, 1);
    myLCD.print("<In  s>");
    for (int i=3; i; i--) {
      myLCD.setCursor(8, 1);
      myLCD.print(i);
      delay(1000);
    }
    digitalWrite(BackLight, LOW);
  }
  
};

LCD lcd;
