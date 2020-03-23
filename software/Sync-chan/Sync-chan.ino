#include "AdcReader.h"
#include "ArduinoTapTempo.h"
#include "BootMode.h"
#include "HardwareInspection.h"
#include "MsTimer2.h"
#include "Pins.h"
#include "TM1640.h"
#include "TimerOne.h"

#include "SyncBpm.h"

uint32_t timerValue = 0;

TM1640 tm1640(pin::DIN_7Seg, pin::SCLK_7Seg);
ArduinoTapTempo tapTempo;
AdcReader tempoAdc(pin::Tempo);
AdcReader faderAdc(pin::Fader);
SyncBpm syncBpm;

pin::DigitalPinConfig digitalPinConfigs[] = {
    {pin::Sync_Out, OUTPUT},
    {pin::Ext_Sync, INPUT},
    {pin::Tap, INPUT_PULLUP},
    {pin::NudgeMinus, INPUT_PULLUP},
    {pin::NudgePlus, INPUT_PULLUP},
    {pin::Led_Tap, OUTPUT},
    {pin::Led_Internal, OUTPUT},
    {pin::Led_External, OUTPUT},
    {pin::Led_Fader_Center, OUTPUT},
};

enum
{
    INTERNAL_PULSE_MSEC = 5, // original spec seems 15msec
};

enum Mode
{
    INTERNAL_MODE,
    EXTERNAL_MODE,
    UNKNOWN_MODE,
};

Mode mode = UNKNOWN_MODE;

void switchMode(const Mode newMode)
{
    mode = newMode;

    auto led_internal = LOW;
    auto led_external = LOW;

    switch (mode) {
    case INTERNAL_MODE:
        led_internal = HIGH;
        break;
    case EXTERNAL_MODE:
        led_external = HIGH;
        timerValue   = bpmToSyncTimerCounter(1200 / 10.f); // default bpm for checking sync connection
        break;
    default:
        break;
    }

    digitalWrite(pin::Led_Internal, led_internal);
    digitalWrite(pin::Led_External, led_external);
}

void internalMode_loop();
void externalMode_loop();

void timer2Callback()
{
    if (mode == INTERNAL_MODE) {
        digitalWrite(pin::Sync_Out, LOW);
    }

    MsTimer2::stop();
}

int interruptCounter              = 0; // todo follow step size
int externalSyncNotCommingCounter = 0;
void externalSyncInterrupt()
{
    externalSyncNotCommingCounter = 0;

    if (mode == INTERNAL_MODE) {
        switchMode(EXTERNAL_MODE);
    }

    const auto pinState = digitalRead(pin::Ext_Sync);
    digitalWrite(pin::Sync_Out, pinState);

    if (pinState == HIGH) {
        syncBpm.incomingPulse();
    }
}

void setup()
{
    for (auto&& config : digitalPinConfigs) {
        pinMode(config.pinNo, config.mode);
    }

    Serial.begin(115200);
    const auto mode = bootMode::getBootMode();
    Serial.print("Boot Mode: ");
    Serial.println(mode);

    if (mode == bootMode::INSPECTION) {
        startHardwareInspection();
    }

    MsTimer2::set(INTERNAL_PULSE_MSEC, timer2Callback);
    tm1640.init(4, 2);

    Timer1.initialize();
    Timer1.attachInterrupt(timerFunction);
    Timer1.start();
    switchMode(INTERNAL_MODE);
    attachInterrupt(digitalPinToInterrupt(pin::Ext_Sync), externalSyncInterrupt, CHANGE);
}

void updateTempo7Seg(const uint16_t tempo)
{
    uint8_t digits[4];
    digits[0] = tempo / 1000;
    digits[1] = (tempo % 1000) / 100;
    digits[2] = ((tempo % 1000) % 100) / 10;
    digits[3] = ((tempo % 1000) % 100) % 10;

    for (auto i = 0; i < 4; i++) {
        tm1640.setDigit(i, digits[i]);
    }
}

int nudge()
{
    const auto minus = digitalRead(pin::NudgeMinus) == LOW ? -1 : 0;
    const auto plus  = digitalRead(pin::NudgePlus) == LOW ? 1 : 0;

    return minus + plus;
}

void timerFunction()
{
    if (mode == INTERNAL_MODE) {
        digitalWrite(pin::Sync_Out, HIGH);
        Timer1.setPeriod(timerValue); // timer period must be set here to make "continuous" tempo output
        MsTimer2::start();
        return;
    }

    if (mode == EXTERNAL_MODE) {
        externalSyncNotCommingCounter++;

        if (externalSyncNotCommingCounter >= 16) {
            externalSyncNotCommingCounter = 0;
            switchMode(INTERNAL_MODE);
        }
    }
}

uint32_t bpmToSyncTimerCounter(const float bpm)
{
    const auto ret = (uint32_t)((60000000 / bpm / 4.f) + 0.5);
    return ret;
}

void loop()
{
    switch (mode) {
    case INTERNAL_MODE:
        internalMode_loop();
        break;
    case EXTERNAL_MODE:
        externalMode_loop();
        break;
    default:
        break;
    }

    tm1640.loop();
}

uint32_t lastKnobTempo = 0;
uint32_t lastTapTempo  = 0;
uint32_t lastTempo     = 0;

uint32_t getKnobTempo()
{
    auto knob    = tempoAdc.read();
    auto knobBpm = map(knob, 0, 1023, 3000, 24000);
    knobBpm      = knobBpm - knobBpm % 100;
    knobBpm /= 10;

    return knobBpm;
}

float getFaderPercent()
{
    auto fader       = faderAdc.read();
    auto faderOffset = map(fader, 0, 1023, 3000, -3000);
    faderOffset      = faderOffset - faderOffset % 100;
    faderOffset /= 100;
    float faderPercent = ((float)faderOffset) / 10.f;

    auto faderCenter = LOW;
    if (faderPercent > -0.01 && faderPercent < 0.01) {
        faderCenter = HIGH;
    }
    digitalWrite(pin::Led_Fader_Center, faderCenter);

    return faderPercent;
}

void internalMode_loop()
{
    const auto buttonDown = digitalRead(pin::Tap) == LOW;
    tapTempo.update(buttonDown);

    int32_t newTapTempo  = 0;
    bool tapTempoChanged = false;
    if (buttonDown) {
        tapTempoChanged = true;
        newTapTempo     = (int)(tapTempo.getBPM() * 10);
        Serial.println(newTapTempo);
    }

    bool knobTempoChanged = false;
    auto knobTempo        = getKnobTempo();
    if (knobTempo != lastKnobTempo) {
        knobTempoChanged = true;
        lastKnobTempo    = knobTempo;
    }

    int32_t newTempo = 0;
    if (tapTempoChanged) {
        newTempo = newTapTempo;
    } else if (knobTempoChanged) {
        newTempo = knobTempo;
    } else {
        newTempo = lastTempo;
    }
    lastTempo = newTempo;

    const int32_t nudgedTempo = newTempo + (newTempo * nudge() * 1.2 / 100.f);
    const int32_t faderTempo  = nudgedTempo * (100.f + getFaderPercent()) / 100.f;

    updateTempo7Seg(faderTempo);

    const auto newTimerValue = bpmToSyncTimerCounter(nudgedTempo / 10.f);

    if (timerValue != newTimerValue) {
        timerValue = newTimerValue;
    }
}

int lastExternalBpm = 0;
void externalMode_loop()
{
    const auto externalBpm = (int)(syncBpm.getBPM() * 10);

    if (externalBpm != lastExternalBpm) {
        lastExternalBpm = externalBpm;
        updateTempo7Seg(externalBpm);
    }
}