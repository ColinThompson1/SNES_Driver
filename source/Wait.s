//WAIT SUBROUTINE

.section .text

.globl Wait

Wait:
	mov	r3, r0			//put time parameter in r3
	ldr r0, =0x20003004 // address of CLO 
	ldr r1, [r0] // read CLO 
	add r1, r3 // add time passed in r6 
WaitLoop: 
	ldr r2, [r0] 
	cmp r1, r2 // stop when CLO = r1 
	bhi WaitLoop 
	bx lr
