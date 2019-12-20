#pragma once
#include <stdint.h>

class TM1627
{
public:
    TM1627(const int numDigits, const int stb_pin, const int clk_pin, const int dio_pin);
    void init();
    void clear();
    void sendLedData(uint8_t *array);

  private:
    void wait();
    void startCondition();
    void stopCondition();
    void stbPulse();
    void sendBit(const uint8_t value);
    void sendByte(uint8_t data);
    
    int numDigits;
    int stb_pin;
    int clk_pin;
    int dio_pin;
};