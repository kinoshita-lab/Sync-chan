#include "AdcReader.h"
#include "ArduinoTapTempo.h"
#include "BootMode.h"
#include "HardwareInspection.h"
#include "MsTimer2.h"
#include "Pins.h"
#include "TM1640.h"
#include "TimerOne.h"

bool timerStarted   = false;
int globalTempo     = 1200;
uint32_t timerValue = 0;
TM1640 tm1640(pin::DIN_7Seg, pin::SCLK_7Seg);
ArduinoTapTempo tapTempo;

AdcReader tempoAdc(pin::Tempo);
AdcReader faderAdc(pin::Fader);

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

enum Mode
{
    INTERNAL_MODE,
    EXTERNAL_MODE,
};
Mode mode = INTERNAL_MODE;

void internalMode();
void externalMode();

void timer2Callback()
{
    digitalWrite(pin::Sync_Out, LOW);
    MsTimer2::stop();
}

void setup()
{
    for (auto&& config : digitalPinConfigs) {
        pinMode(config.pinNo, config.mode);
    }

    Serial.begin(115200);
    const auto mode = BootMode::getBootMode();
    Serial.print("Boot Mode: ");
    Serial.println(mode);

    if (mode == BootMode::Inspection) {
        startHardwareInspection();
    }
    Timer1.initialize();
    Timer1.attachInterrupt(timerFunction);
    Timer1.start();
    MsTimer2::set(5, timer2Callback);
    tm1640.init(4, 2);
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

bool onOff = false;
void timerFunction()
{
    digitalWrite(pin::Sync_Out, HIGH);
    Timer1.setPeriod(timerValue); // timer period must be set here to make "continuous" tempo output
    MsTimer2::start();
}

uint32_t bpmToSyncTimerCounter(const float bpm)
{
    const auto ret = (uint32_t)((60000000 / bpm / 4.f) + 0.5);
    return ret;
}

void loop()
{

    const auto buttonDown = digitalRead(pin::Tap) == LOW;
    tapTempo.update(buttonDown);
    if (buttonDown) {
        const int tap = (int)(tapTempo.getBPM() * 10);
        Serial.println(tap);
    }

    auto knob    = tempoAdc.read();
    auto knobBpm = map(knob, 0, 1023, 3000, 24000);
    knobBpm      = knobBpm - knobBpm % 100;
    knobBpm /= 10;

    globalTempo = knobBpm;

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
    auto actualTempo = knobBpm * (100.f + faderPercent) / 100.f;
    int nudgeTempo   = actualTempo + (actualTempo * nudge() * 1.2 / 100.f);
    updateTempo7Seg(nudgeTempo);

    tm1640.loop();
    const auto newTimerValue = bpmToSyncTimerCounter(nudgeTempo / 10.f);

    if (timerValue != newTimerValue) {
        timerValue = newTimerValue;
    }
}
