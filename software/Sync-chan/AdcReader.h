#pragma once

class AdcReader
{
private:
    int roundWithShift(const int input) { return input >> SHIFT_ROUND << SHIFT_ROUND; }

public:
    AdcReader(const int adcPin)
        : adcPin(adcPin), oldValue(roundWithShift(analogRead(adcPin))) {}

    int read() {
        const auto raw = analogRead(adcPin) >> SHIFT_ROUND << SHIFT_ROUND;
        const auto absDelta = abs(raw - oldValue);

        if (absDelta > DEAD_BAND) {
            oldValue = raw;
        }

        return oldValue;
    }
    
private:
    enum 
    {   
        SHIFT_ROUND = 3,
        DEAD_BAND = 4,
    };
    
    int adcPin;
    int oldValue;

    // todo: need some ema parameters
};