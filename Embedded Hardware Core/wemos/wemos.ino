
#include "wifi.h"
#include "irrigation.h"
#include "gsm.h"
#include "soilMoisture.h"
#include "dht.h"
#include "sdCard.h"

void setup() {
  wifi.begin();
  gsm.begin();
  sdCard.begin();
  dht.begin();
  soilMoisture.begin();
  irrigate.begin();
}

void loop() {
  //  ----------------------- Retrieve values -----------------------
  int s = soilMoisture.get();
  float t = dht.getTemperature();
  float h = dht.getHumidity();

  //  --------- Check automatic or manual irrigation status ---------
  irrigate.manualApplication();
  irrigate.automatic(s);
  gsm.lookForNewCommand(s, t, h);
  
  //  --------------------- Log inside SD-Card ----------------------
  sdCard.logValues(s, t, h);

  //  ------------------- Post records on server --------------------
  wifi.clientPostRecord(s, t, h);

  delay(1000);
}
