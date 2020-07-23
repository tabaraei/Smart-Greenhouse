
#include "lcd.h"
#include "gsm.h"
#include "command.h"
#include "deepSleep.h"

void setup() {
  lcd.begin();
  gsm.begin();
  
  // get message received from gsm serial port
  gsm.readNewMessage();

  // looking for sender number
  String number = gsm.getNumber();
  lcd.print("New Message!", 0);
  lcd.print(number, 1);

  // delay for updating lcd
  delay(1000);
  lcd.clear();

  // looking for command within sms content
  String cmd = gsm.getCommand();
  lcd.print("Your Command", 0);
  lcd.print("<" + cmd + ">", 1);

  if (cmd != "Not Found") {
    // sending command to wemos, in order to execute code
    String response = serial.runCommand(cmd);
    
    if (response == "Irrigation Started!") {
      // irrigation started
      lcd.clear();
      lcd.print("Irrigation", 0);
      lcd.print("Started", 1);
      
    } else if (response == "Irrigation Stopped!") {
      // irrigation started
      lcd.clear();
      lcd.print("Irrigation", 0);
      lcd.print("Stopped", 1);
      
    }

    // send response with gsm
      gsm.begin();
      gsm.sendMessage(response, number);
      lcd.clear();
      lcd.print("Message Sent to", 0);
      lcd.print(number, 1);
  }

  // delay for updating lcd
  delay(2000);
  lcd.clear();
  lcd.sleep();
  deepSleep();
}

void loop() {
  // module will shut down after excecution of "sleep()" function
  // therefore, loop won't be needed since we have deepSleep with external interrupt on "RST" pin.
}
