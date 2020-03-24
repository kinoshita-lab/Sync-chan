#include "AdcReader.h"
#include "ArduinoTapTempo.h"
#include "BootMode.h"
#include "HardwareInspection.h"
#include "MsTimer2.h"
#include "Pins.h"
#include "TM1640.h"
#include "TimerOne.h"

#include "SyncBpm.h"

/***************************************
 * Configurable Parameters
***************************************/
const uint8_t INTERNAL_PULSE_MSEC = 5;   // original spec seems 15msec, but not working...
const float NUDGE_PERCENT         = 1.2; // +-% for nudge

const float DIV_FOR_1STEP = 4.f;
const float DIV_FOR_2STEP = 2.f;

struct StepParameter
{
    float step_div;
    uint8_t notComingCounterMax;
    StepParameter() : step_div(DIV_FOR_1STEP), notComingCounterMax(16) {}
};
StepParameter stepParameter;

enum StepMode
{
    STEP_1,
    STEP_2,
};
int stepMode = STEP_1;

void setStepParameter(StepParameter& s, const StepMode mode)
{
    Serial.print("StepMode:");
    Serial.println(mode);
    switch (mode) {
    case STEP_1:
        s.step_div            = DIV_FOR_1STEP;
        s.notComingCounterMax = 16;
        break;
    case STEP_2:
        s.step_div            = DIV_FOR_2STEP;
        s.notComingCounterMax = 8;
    default:
        break;
    }
}

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

enum ApplicationMode
{
    INTERNAL_MODE,
    EXTERNAL_MODE,
    UNKNOWN_MODE,
};

ApplicationMode applicationMode = UNKNOWN_MODE;

void switchMode(const uint8_t newMode)
{
    applicationMode = newMode;

    auto led_internal = LOW;
    auto led_external = LOW;

    switch (applicationMode) {
    case INTERNAL_MODE:
        led_internal = HIGH;
        break;
    case EXTERNAL_MODE:
        led_external = HIGH;
        timerValue   = bpmToSyncTimerCounter(120.0); // default bpm for checking sync connection
        Timer1.setPeriod(timerValue);
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
    if (applicationMode == INTERNAL_MODE) {
        digitalWrite(pin::Sync_Out, LOW);
    }

    MsTimer2::stop();
}

int externalSyncNotCommingCounter = 0;
void externalSyncInterrupt()
{
    externalSyncNotCommingCounter = 0;

    if (applicationMode == INTERNAL_MODE) {
        switchMode(EXTERNAL_MODE);
    }

    const auto pinState = digitalRead(pin::Ext_Sync);
    digitalWrite(pin::Sync_Out, pinState);

    if (pinState == HIGH) {
        syncBpm.incomingPulse();
    }
}

void showStepMode(const int mode)
{
    switch (mode) {
    case bootMode::NORMAL_1STEP:
        updateTempo7Seg(1111);
        break;
    case bootMode::NORMAL_2STEP:
        updateTempo7Seg(2222);
        break;
    default:
        break;
    }
    tm1640.loop();
    delay(1000);
}

void setup()
{
    for (auto&& config : digitalPinConfigs) {
        pinMode(config.pinNo, config.mode);
    }

    Serial.begin(115200);
    auto mode = bootMode::getBootMode();
    Serial.print("Boot Mode: ");
    Serial.println(bootMode::bootModeText(mode));

    if (mode == bootMode::INSPECTION) {
        startHardwareInspection();
        mode = bootMode::NORMAL_1STEP;
    }
    stepMode = mode == bootMode::NORMAL_1STEP ? STEP_1 : STEP_2;
    setStepParameter(stepParameter, stepMode);
    Serial.println(stepMode);
    syncBpm.setMode(stepMode == STEP_1 ? SyncBpm::SYNC_1BEAT : SyncBpm::SYNC_2BEAT);

    tm1640.init(4, 2);
    showStepMode(mode);

    MsTimer2::set(INTERNAL_PULSE_MSEC, timer2Callback);
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
    if (applicationMode == INTERNAL_MODE) {
        digitalWrite(pin::Sync_Out, HIGH);
        Timer1.setPeriod(timerValue); // timer period must be set here to make "continuous" tempo output
        MsTimer2::start();
        return;
    }

    if (applicationMode == EXTERNAL_MODE) {
        externalSyncNotCommingCounter++;
        if (externalSyncNotCommingCounter >= stepParameter.notComingCounterMax) {
            externalSyncNotCommingCounter = 0;
            switchMode(INTERNAL_MODE);
        }
    }
}

uint32_t bpmToSyncTimerCounter(const float bpm)
{
    const auto ret = (uint32_t)((60000000 / bpm / stepParameter.step_div) + 0.5);
    return ret;
}

void loop()
{
    switch (applicationMode) {
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

    const int32_t nudgedTempo = newTempo + (newTempo * nudge() * NUDGE_PERCENT / 100.f);
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
    digitalWrite(pin::Led_Fader_Center, LOW);
    if (externalBpm != lastExternalBpm) {
        lastExternalBpm = externalBpm;
        updateTempo7Seg(externalBpm);
    }
}