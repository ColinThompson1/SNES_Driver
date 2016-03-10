// A subroutine to write a single bit to the GPIO Clock line.
// Version 1.0

.section .text

.globl Write_Clock

// @param r0: The value to write.
Write_Clock:
	push {r1, r2, r3}
	ldr r2, =0x20200000 //Base GPIO reg
	mov r3, #1 //0b001
	lsl r3, #11 //align for appropriate pin
	teq r1, #0
	streq r3, [r2, #40] //GPCLR0
	strne r3, [r2, #28] //GPSET0
	pop {r1, r2, r3}
	bx lr
