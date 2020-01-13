#ifndef HighResolutionMsTimer2_h
#define HighResolutionMsTimer2_h

#ifdef __AVR__
#include <avr/interrupt.h>
#elif defined(__arm__) && defined(TEENSYDUINO)
#include <Arduino.h>
#else
#error HighResolutionMsTimer2 library only works on AVR architecture
#endif

namespace HighResolutionMsTimer2 {
extern unsigned long msecs;
extern void (*func)();
extern volatile unsigned long count;
extern volatile char overflowing;
extern volatile unsigned int tcnt2;

void set(unsigned long ms, void (*f)());
void start();
void stop();
void _overflow();
} // namespace HighResolutionMsTimer2

#endif