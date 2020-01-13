#include "Pins.h"
#include "HardwareInspection.h"
#include "TM1640.h"
#include "ArduinoTapTempo.h"
#include "AdcReader.h"

int globalTempo = 1200;
TM1640 tm(pin::DIN_7Seg, pin::SCLK_7Seg);
ArduinoTapTempo tapTempo;

AdcReader tempoAdc(pin::Tempo);
AdcReader faderAdc(pin::Fader);

pin::DigitalPinConfig digitalPinConfigs[] = 
{
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

namespace bootMode
{
enum
{
    Normal = 7,
    Inspection = 6,
};
}
int getBootMode()
{
    uint8_t switchPattern = 0;
    switchPattern |= (digitalRead(pin::NudgeMinus) << 2);
    switchPattern |= (digitalRead(pin::NudgePlus) << 1);
    switchPattern |= (digitalRead(pin::Tap));

    return switchPattern;
}


void setup()
{
    for (auto&& dpc : digitalPinConfigs) {
        pinMode(dpc.pinNo, dpc.mode);
    }

    Serial.begin(115200);
    const auto bootMode = getBootMode();
    Serial.print("Boot Mode: ");
    Serial.println(bootMode);
    
    if (bootMode == bootMode::Inspection) {
        startHardwareInspection();
    }
    tm.init();
    tm.dp = true;
    
#if 0
    // TIMER 2 for interrupt frequency 200000 Hz:
    cli(); // stop interrupts
    TCCR2A = 0; // set entire TCCR2A register to 0
    TCCR2B = 0; // same for TCCR2B
    TCNT2  = 0; // initialize counter value to 0
    // set compare match register for 200000 Hz increments
    OCR2A = 79; // = 16000000 / (1 * 200000) - 1 (must be <256)
    // turn on CTC mode
    TCCR2B |= (1 << WGM21);
    // Set CS22, CS21 and CS20 bits for 1 prescaler
    TCCR2B |= (0 << CS22) | (0 << CS21) | (1 << CS20);
    // enable timer compare interrupt
    TIMSK2 |= (1 << OCIE2A);
    sei(); // allow interrupts
#endif    
}

ISR(TIMER2_COMPA_vect){
   //interrupt commands for TIMER 2 here
}


void updateTempo7Seg(const uint16_t tempo)
{
    uint8_t digits[TM1640::NUM_DIGITS];
    digits[0] = tempo / 1000;
    digits[1] = (tempo % 1000) / 100;
    digits[2] = ((tempo % 1000)  % 100) / 10;
    digits[3] = ((tempo % 1000)  % 100) % 10;

    for (auto i = 0; i < TM1640::NUM_DIGITS; i++) {
        tm.setDigit(i, digits[i]);
    }
}

uint32_t readAdc(const int pin) {
    const int numLoop = 8;
    uint32_t sum = 0;

    for (auto i = 0; i < numLoop; ++i) {
        sum += analogRead(pin) >> 3 << 3;
    }

    return sum >> 3;

}

int nudge() 
{
    const auto minus = digitalRead(pin::NudgeMinus) == LOW ? -1 : 0;
    const auto plus  = digitalRead(pin::NudgePlus) == LOW ? 1 : 0;

    return minus + plus;
}

int bpmToSyncTimerCounter(const float bpm) 
{   
    const auto ret = 6000000 / bpm / 4.f;
    Serial.println(ret);
    
    return ret;
}
    


void loop()
{
#if 0
    const auto buttonDown = digitalRead(pin::Tap) == LOW;
    tapTempo.update(buttonDown);
    const int tap = (int)(tapTempo.getBPM() * 10);
    globalTempo = tap;
#endif
    auto knob = tempoAdc.read();
    auto knobBpm = map(knob, 0, 1023, 3000, 24000);
    knobBpm = knobBpm - knobBpm % 100;
    knobBpm /= 10;

    globalTempo = knobBpm;

    auto fader = faderAdc.read();
    auto faderOffset = map(fader, 0, 1023, 3000, -3000);
    faderOffset = faderOffset - faderOffset % 100;
    faderOffset /= 100;
    float faderPercent = ((float)faderOffset) / 10.f;
    auto actualTempo = knobBpm * (100.f + faderPercent) / 100.f;
    int nudgeTempo = actualTempo + (actualTempo * nudge() * 1.2 / 100.f);    
    updateTempo7Seg(nudgeTempo);
    Serial.println(nudgeTempo);
    tm.loop();
    bpmToSyncTimerCounter(nudgeTempo / 10.f);
}

