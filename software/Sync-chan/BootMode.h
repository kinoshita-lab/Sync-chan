#include "Pins.h"

namespace bootMode
{
enum
{
    NORMAL_1STEP = 7,
    NORMAL_2STEP = 6,

    INSPECTION = 0,
};
int getBootMode();
}