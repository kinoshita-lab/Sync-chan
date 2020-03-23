/** @file 
 * http://www.titanmicro.cn/h-pd-14.html
 */
#pragma once
#include <stdint.h>

class TM1640
{

private:
    enum
    { //            dGFEDCBA
        DIGIT_0 = 0b00111111,
        DIGIT_1 = 0b00000110,
        DIGIT_2 = 0b01011011,
        DIGIT_3 = 0b01001111,
        DIGIT_4 = 0b01100110,
        DIGIT_5 = 0b01101101,
        DIGIT_6 = 0b01111101,
        DIGIT_7 = 0b00000111,
        DIGIT_8 = 0b01111111,
        DIGIT_9 = 0b01101111,

        DIGIT_DP = 0b10000000, // use it with OR binary operation
        ALL_OFF  = 0b00000000,

        NUM_DIGIT_TABLE_ELEM = 12,
    };

    enum
    {
        MAX_NUMBER_OF_DIGIT = 16,
    };

    uint8_t din_pin;
    uint8_t sclk_pin;
    int dp; // -1 for no decimal point
    int numDigits;
    bool changed;
    uint8_t patterns[MAX_NUMBER_OF_DIGIT];

    // seems unnecessary for ATmega328 based arduino
    void wait()
    {
        // delay(1);
    }

    uint8_t toLedPattern(const uint8_t number)
    {
        switch (number) {
        case 0:
            return DIGIT_0;
        case 1:
            return DIGIT_1;
        case 2:
            return DIGIT_2;
        case 3:
            return DIGIT_3;
        case 4:
            return DIGIT_4;
        case 5:
            return DIGIT_5;
        case 6:
            return DIGIT_6;
        case 7:
            return DIGIT_7;
        case 8:
            return DIGIT_8;
        case 9:
            return DIGIT_9;
        default:
            return 0;
        }
    }

    void startCondition()
    {
        digitalWrite(din_pin, LOW);
        wait();
        digitalWrite(sclk_pin, LOW);
    }

    void endCondition()
    {
        digitalWrite(sclk_pin, HIGH);
        wait();
        digitalWrite(din_pin, HIGH);
        wait();
    }

    void sendBit(const uint8_t bit)
    {
        digitalWrite(sclk_pin, LOW);
        wait();
        digitalWrite(din_pin, bit);
        wait();
        digitalWrite(sclk_pin, HIGH);
        wait();
        digitalWrite(sclk_pin, LOW);
        wait();
        digitalWrite(din_pin, LOW);
        wait();
    }

    void sendByte(uint8_t data)
    {
        for (auto i = 0; i < 8; ++i) {
            const auto bit = data & 0x01;
            sendBit(bit);
            data >>= 1;
        }
    }

public:
    TM1640(const uint8_t din_pin, const uint8_t sclk_pin)
        : din_pin(din_pin), sclk_pin(sclk_pin) {}

    void init(const int _numDigits = 0, const int _dp = 0)
    {
        dp        = _dp;
        numDigits = _numDigits;
        changed   = false;

        for (auto i = 0; i < numDigits; ++i) {
            patterns[i] = 0;
        }

        pinMode(din_pin, OUTPUT);
        pinMode(sclk_pin, OUTPUT);
        digitalWrite(sclk_pin, HIGH);
        digitalWrite(din_pin, HIGH);

        // set address mode and brightness
        startCondition();
        sendByte(0b01000000); // Address auto increment
        endCondition();

        startCondition();
        sendByte(0b00000001);
        endCondition();

        allOn();
    }

    void allOn()
    {
        startCondition();
        sendByte(0b11000000); // from 0
        startCondition();

        for (auto i = 0; i < numDigits; ++i) {
            uint8_t sendData = 0xFF;
            sendByte(sendData);
        }
        endCondition();

        startCondition();
        sendByte(0b10001100);
        endCondition();
    }

    void allOff()
    {
        startCondition();
        sendByte(0b11000000); // from 0

        startCondition();
        for (auto i = 0; i < 4; ++i) {
            uint8_t sendData = 0;
            sendByte(sendData);
        }
        endCondition();

        startCondition();
        sendByte(0b10001100);
        endCondition();
    }

    void setDigit(const int digit, const uint8_t value)
    {
        uint8_t pattern = toLedPattern(value);
        if (dp == digit) {
            pattern |= DIGIT_DP;
        }

        if (patterns[digit] != pattern) {
            changed         = true;
            patterns[digit] = pattern;
        }
    }

    // call it from loop()
    void loop()
    {
        if (!changed) {
            return;
        }

        startCondition();
        sendByte(0b11000000); // from 0

        for (auto i = 0; i < numDigits; ++i) {
            uint8_t data = patterns[i];
            sendByte(data);
        }

        endCondition();
    }

    void test()
    {
        while (true) {
            for (auto n = 0; n < 10; n++) {
                init();
                startCondition();
                sendByte(0b11000000); // from 0

                for (auto i = 0; i < 4; ++i) {
                    uint8_t sendData = toLedPattern(n);
                    if (i == 2) {
                        sendData |= DIGIT_DP;
                    }
                    sendByte(sendData);
                }
                endCondition();
                delay(50);
            }
        }
    }
};
