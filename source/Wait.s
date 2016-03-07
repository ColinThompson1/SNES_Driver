//WAIT SUBROUTINE

.section .text

.globl Wait

//r0: input parameter <-- time to wait
Wait:
	mov	r3, r0			//put time parameter in r3

	ldr 	r0, =0x20003004 	// address of CLO
	ldr 	r1, [r0] 		// read CLO
	add 	r1, r3			// add amount of time to wait
waitLoop:
	ldr 	r2, [r0]		//read CLO
	cmp 	r1, r2 			// stop when CLO = r1
	bhi 	waitLoop
	

	bx	lr
