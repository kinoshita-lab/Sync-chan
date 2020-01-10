#include "Pins.h"
#include "HardwareInspection.h"
#include "TM1640.h"

TM1640 tm(pin::DIN_7Seg, pin::SCLK_7Seg);

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
    const auto testMode = getBootMode();
    Serial.print("Boot Mode: ");
    Serial.println(testMode);
    
    // todo: switch app and inspection
    startHardwareInspection();
}

void loop()
{

}

