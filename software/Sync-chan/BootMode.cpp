#include "BootMode.h"

namespace bootMode
{
int getBootMode()
{
    uint8_t switchPattern = 0;
    switchPattern |= (digitalRead(pin::NudgeMinus) << 2);
    switchPattern |= (digitalRead(pin::NudgePlus) << 1);
    switchPattern |= (digitalRead(pin::Tap));

    return switchPattern;
}

const char* bootModeText(const int mode)
{
    switch (mode) {
    case INSPECTION:
        return "Inspection";
        break;
    case NORMAL_1STEP:
        return "1Step";
        break;
    case NORMAL_2STEP:
        return "2Step";
        break;
    default:
        return "Unknown";
    }
}
}