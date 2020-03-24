#pragma once

class AdcReader
{
private:
    int roundWithShift(const int input)
    {
        return input >> SHIFT_ROUND << SHIFT_ROUND;
    }

public:
    AdcReader(const int adcPin)
        : adcPin(adcPin), value(roundWithShift(analogRead(adcPin))) {}

    int read()
    {

        int sum = 0;

        for (auto i = 0; i < 4; ++i) {
            const auto raw = analogRead(adcPin) >> SHIFT_ROUND << SHIFT_ROUND;
            sum += raw;
        }
        sum >>= 2;
        value = (int)(value * 0.98 + sum * 0.02);

        return value;
    }

private:
    enum
    {
        SHIFT_ROUND = 3,
        DEAD_BAND   = 4,
    };

    int adcPin;
    int value;
};