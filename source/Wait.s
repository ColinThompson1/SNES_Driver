// Wait for the time given in r0 in microseconds.

.section .text

.globl Wait

Wait:
	mov	r4, r0					// Put time parameter in r4
	ldr r0, =0x20003004 // Address of CLO
	ldr r5, [r0] 				// Read CLO
	add r5, r4 					// Add time passed in r6
WaitLoop:
	ldr r6, [r0]
	cmp r5, r6 					// Stop when CLO = r5
	bhi WaitLoop
	bx lr
