#pragma once
#include <stdint.h>
class SyncBpm
{
protected:
    int mode;
    uint32_t lastMicros;

    enum
    {
        ARRAY_SIZE = 16,
    };

    float bpm;
    uint8_t counter;
    uint32_t deltas[ARRAY_SIZE];
    uint32_t averageDelta;

public:
    enum
    {
        SYNC_1BEAT,
        SYNC_2BEAT, // todo
    };

    SyncBpm() : mode(SYNC_1BEAT), lastMicros(micros()), bpm(120.f), averageDelta(0)
    {
        for (auto&& delta : deltas) {
            delta = 0;
        }
    }

    void setMode(const int m)
    {
        mode = m;
    }

    void incomingPulse()
    {
        const auto now        = micros();
        const auto deltaMicro = now - lastMicros;
        lastMicros            = now;

        deltas[counter] = deltaMicro;
        counter         = (counter + 1) & (ARRAY_SIZE - 1);

        uint32_t sum = 0;
        for (auto&& delta : deltas) {
            sum += delta;
        }

        averageDelta = sum / ARRAY_SIZE;
    }

    float getBPM()
    {
        const auto beatDeltaMsec = averageDelta * 4; // todo
        const float bpm          = 60000000.f / beatDeltaMsec;
        return bpm;
    }
};