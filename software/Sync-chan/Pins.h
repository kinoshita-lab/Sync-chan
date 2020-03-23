#pragma once
#include <Arduino.h>
#include <stdint.h>

namespace pin
{
struct DigitalPinConfig
{
    uint8_t pinNo;
    uint8_t mode;
};

// digital pins
enum
{
    Sync_Out         = A0,
    Ext_Sync         = 2,
    Tap              = 3,
    NudgeMinus       = 4,
    NudgePlus        = 5,
    Led_Tap          = 7,
    Led_Internal     = 8,
    Led_External     = 9,
    Led_Fader_Center = 10,
    DIN_7Seg         = 11,
    SCLK_7Seg        = 12,
};

// analog pins
enum
{
    Fader = 1,
    Tempo = 2,
};
} // namespace pin