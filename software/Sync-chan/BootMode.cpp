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
}