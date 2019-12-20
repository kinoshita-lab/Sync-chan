#include "Pins.h"
#include "HardwareInspection.h"
#include "TM1627.h"

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
    {pin::DIO_7Seg, OUTPUT},
    {pin::CLK_7Seg, OUTPUT},
    {pin::STB_7Seg, OUTPUT},
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

    digitalWrite(pin::STB_7Seg, LOW);
    TM1627 tm1627(5, pin::STB_7Seg, pin::CLK_7Seg, pin::DIO_7Seg);
    tm1627.init();

    uint8_t array[14];
    for (uint16_t n = 0; n <= 0xFF; ++n) {
        for (auto i = 0; i < 14; ++i) {
            array[i] = n;
        }
        tm1627.sendLedData(array);
        Serial.println(n);
    }


    
    // todo: switch app and inspection
    startHardwareInspection();
}

void loop()
{

}

