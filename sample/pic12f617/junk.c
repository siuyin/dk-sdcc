#include <pic14regs.h>
#include <stdint.h>

__code uint16_t __at (_CONFIG) __configword = _INTRC_OSC_NOCLKOUT & _WDTE_OFF & _BOREN_OFF;

#define LED_PORT GP5
#define LED_TRIS TRISA5

// Uncalibrated delay, just waits a number of for-loop iterations
void delay(uint16_t iterations) {
	uint16_t i;
	for (i = 0; i < iterations; i++) {
		// Prevent this loop from being optimized away.
		__asm nop __endasm;
	}
}

void main(void) {
	LED_TRIS = 0;
	LED_PORT = 0;

	while(1) {
		LED_PORT = 1;
		delay(20000);
		LED_PORT = 0;
		delay(20000);
	}
}
