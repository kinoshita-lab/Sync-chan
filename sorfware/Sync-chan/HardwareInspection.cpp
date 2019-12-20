#include <Arduino.h>
#include "HardwareInspection.h"
#include "Pins.h"

enum 
{
    All_LED_On = 0,
    All_LED_Off = 1,
    End,
};

int step = All_LED_On;

void waitForTapSw();

void allLedOn() 
{
  Serial.println("Confirm All LEDs are turning On");
    
  digitalWrite(pin::Sync_Out, HIGH);
  digitalWrite(pin::Led_Tap, HIGH);
  digitalWrite(pin::Led_Internal, HIGH);
  digitalWrite(pin::Led_External, HIGH);
  digitalWrite(pin::Led_Fader_Center, HIGH);

  waitForTapSw();
  step++;
}

void allLedOff() {
  Serial.println("Confirm All LED are turning Off except POWER and Float decimal point");

  digitalWrite(pin::Sync_Out, LOW);
  digitalWrite(pin::Led_Tap, LOW);
  digitalWrite(pin::Led_Internal, LOW);
  digitalWrite(pin::Led_External, LOW);
  digitalWrite(pin::Led_Fader_Center, LOW);

  waitForTapSw();
  step++;
}

void waitForTapSw() {
  while (true) {
    auto tap = digitalRead(pin::Tap);
    if (tap == LOW) {
        delay(10);
        tap = digitalRead(pin::Tap);
        if (tap == LOW) {
          break;
        }
    }
  }
}

void startHardwareInspection()
{
  Serial.println("Hardware Inspection start.");
  while (step != End) {
    switch (step) {
    case All_LED_On:
      allLedOn();
      break;
    case All_LED_Off:
        allLedOff();
        break;
      break;
    default:
      break;
    }
    }
}
