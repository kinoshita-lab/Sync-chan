#include "TM1627.h"
#include "Arduino.h"

namespace
{
// Open drain emulation, based on
// https://www.avdweb.nl/arduino/misc/albert-library
void openDrain(const int pin, const int value)
{
    digitalWrite(pin, value);
#if 0    
    if (value) {        
        pinMode(pin, INPUT);
        return;
    }

    pinMode(pin, OUTPUT);
    digitalWrite(pin, LOW);
#endif    
}
}

TM1627::TM1627(const int numDigits, const int stb_pin, const int clk_pin,
               const int dio_pin) : numDigits(numDigits), stb_pin(stb_pin), clk_pin(clk_pin), dio_pin(dio_pin)
{

}

void TM1627::init()
{
    digitalWrite(stb_pin, HIGH);
    openDrain(dio_pin, LOW);
    digitalWrite(clk_pin, HIGH);
}

void TM1627::wait()
{
    delay(1);
    for (volatile auto i = 0; i < 10; ++i) {
        ;
    }
}

void TM1627::clear()
{

}

void TM1627::startCondition()
{
    digitalWrite(stb_pin, LOW);
    wait();
    digitalWrite(clk_pin, LOW);
    wait();
} 
void TM1627::stopCondition()
{
    digitalWrite(clk_pin, HIGH);
    wait();
    digitalWrite(stb_pin, HIGH);
    wait();
}

void TM1627::stbPulse()
{
    digitalWrite(stb_pin, HIGH);
    wait();
    digitalWrite(stb_pin, LOW);
    wait();
} 
void TM1627::sendBit(const uint8_t value)
{
    digitalWrite(clk_pin, LOW);
    openDrain(dio_pin, value);
    wait();
    digitalWrite(clk_pin, HIGH);
    openDrain(dio_pin, LOW);
    wait();
} 

void TM1627::sendByte(uint8_t data)
{
    for (auto i = 0; i < 8; ++i) {
        sendBit(data & 0x01);
        data >>= 1;        
    }
} 

void TM1627::sendLedData(uint8_t *array)
{
    startCondition();
    sendByte(0x03); // 表示モード 7位10段
    stbPulse();

    sendByte(0x40); // 自動アドレスインクリメント
    stbPulse();

    sendByte(0xC0);

    for (auto i = 0; i < 14; ++i) {
        //if (array != nullptr) {
            sendByte(random(255));
        //} else {
    }

    stbPulse();

    sendByte(0x8F); // パルス幅 1/16
    stbPulse();
    stopCondition();
}