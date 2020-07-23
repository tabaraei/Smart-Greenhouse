#include <LowPower.h>

// connect RING(RI) pin on GSM to RST pin of Arduino
// After receiving message, module will wake up automatically

void deepSleep() {
  LowPower.powerDown(SLEEP_FOREVER, ADC_OFF, BOD_OFF);
}
