#include <stdint.h>
#include <Arduino.h>
#include "Pins.h"

namespace BootMode
{
enum 
{
  Normal = 7,
  Inspection = 6,
};
int getBootMode();
}