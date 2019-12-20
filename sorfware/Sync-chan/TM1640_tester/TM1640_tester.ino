#include "TM1640.h"

void setup()
{
    delay(1000);
    TM1640 tm(5, 6);
    tm.init();

    tm.test();
}

void loop()
{
    

}