#include "HardwareInspection.h"
#include "Pins.h"
#include "TM1640.h"
#include <Arduino.h>

extern TM1640 tm;
enum {
  All_LED_ON,
  All_LED_OFF,
  SWITCH,
  TEMPO,
  SYNC,
  END,
};

int step = All_LED_ON;

void waitForSwitch(const int pin);
void waitForTapSw();

void allLedOn() {
  Serial.println(
      "Confirm All LEDs are turning On except Sync in, then press [Tap]");

  digitalWrite(pin::Sync_Out, HIGH);
  digitalWrite(pin::Led_Tap, HIGH);
  digitalWrite(pin::Led_Internal, HIGH);
  digitalWrite(pin::Led_External, HIGH);
  digitalWrite(pin::Led_Fader_Center, HIGH);
  tm.allOn();

  waitForTapSw();
  step++;
}

void allLedOff() {
  Serial.println(
      "Confirm All LED are turning Off except POWER, then press [Tap]");

  digitalWrite(pin::Sync_Out, LOW);
  digitalWrite(pin::Led_Tap, LOW);
  digitalWrite(pin::Led_Internal, LOW);
  digitalWrite(pin::Led_External, LOW);
  digitalWrite(pin::Led_Fader_Center, LOW);
  tm.allOff();

  waitForTapSw();
  step++;
}

auto printAdcValue = [](TM1640& tm, const uint16_t value) {
    uint8_t values[TM1640::NUM_DIGITS];

    if (value <= 999) {
      values[0] = 0;
    } else {
      values[0] = value / 1000;
    }

    if (value <= 99) {
      values[1] = 0;
    } else {
      values[1] = (value % 1000) / 100;
    }

    if (value <= 9) {
      values[2] = 0;
    } else {
      values[2] = ((value % 1000) % 100) / 10;
    }

    values[3] = ((value % 1000) % 100) % 10;

    for (auto i = 0; i < TM1640::NUM_DIGITS; i++) {
      tm.setDigit(i, values[i]);
    }
    tm.loop();
};

void tempo() {
  Serial.println(
      "Turn Tempo Knob From bottom to Top, then turn To Bottom again");

  bool toZero = false;
  bool toMax = false;

  auto ok = [&](const bool toZero, const bool toMax,const uint16_t value) {
    return toZero && toMax && (value == 0);
  };

  auto test = [&](const int analogPin) {
    toZero = false;
    toMax = false;

    while (true) {
      const auto val = analogRead(analogPin);      
      printAdcValue(tm, val);
      if (val == 0) {
        toZero = true;
      }
      if (val == 1023) {
        toMax = true;
      }
      if (ok(toZero, toMax, val)) {
        break;
      }
    }
  };

  test(pin::Tempo);
  Serial.println("Tempo Knob OK prss [TAP]");
  waitForTapSw();

  Serial.println(
      "Turn Tempo Fader From bottom to Top, then turn To Bottom again");
  test(pin::Fader);
  Serial.println("Tempo Fader OK prss [TAP]");
  tm.allOff();
  waitForTapSw();
  step++;
}

void syncInterrupt() {
  const auto pinState = digitalRead(pin::Ext_Sync);
  digitalWrite(pin::Sync_Out, pinState);
}

void switchTest()
{
  Serial.println("Switch Testing.");
  Serial.println("Press [NUDGE-]");
  waitForSwitch(pin::NudgeMinus);

  Serial.println("Press [NUDGE+]");
  waitForSwitch(pin::NudgePlus);
  
  step++;
}

void sync() {
  attachInterrupt(0, syncInterrupt, CHANGE);
  Serial.println(
      "Connect Sync Out Device to Sync in, confirm sync in led is blinking");
  Serial.println(
      "Connect Sync In Device to Each SYnc out, confirm working, then press [Tap]");

  while (true) {
    if (digitalRead(pin::Tap) == LOW) {
      break;
    }
  }
  digitalWrite(pin::Sync_Out, LOW);
  detachInterrupt(0);

  step = END;
}

void waitForSwitch(const int pin) {
  auto waitForPinState = [](const int pin, const int state) {
    while (true) {
      auto tap = digitalRead(pin);
      if (tap == state) {
        delay(10);
        tap = digitalRead(pin);
        if (tap == state) {
          break;
        }
      }
    }
  };
  waitForPinState(pin, LOW);
  waitForPinState(pin, HIGH);
}

void waitForTapSw() {
  waitForSwitch(pin::Tap);
}

void startHardwareInspection() {
  Serial.println("Hardware Inspection start.");
  tm.init();
  while (step != END) {
    switch (step) {
    case All_LED_ON:
      allLedOn();
      break;
    case All_LED_OFF:
      allLedOff();
      break;
    case SWITCH:
      switchTest();
      break;
    case TEMPO:
      tempo();
      break;
    case SYNC:
      sync();
      break;
    default:
      break;
    }
  }

  Serial.println("Hardware Inspection Finished");
}
