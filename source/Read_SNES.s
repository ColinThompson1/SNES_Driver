//READ_SNES SUBROUTINE

//buttons == r6

.section .text

.globl Read_SNES

Read_SNES:
	push {lr, r5, r6}

	mov	r6, #0		//init buttons to 0

	mov	r0, #1		//pass 1 to subroutine
	b	Write_Clock	//write to clock line

	mov	r0, #1		//pass 1 to subroutine
	b	Write_Latch	//write to latch line

	mov	r0, #12		//wait 12 useconds
	b	Wait

	mov	r0, #0		//pass 0 to subroutine
	b	Write_Latch	//

//Pulse Loop

	mov	r5, #0		//init i to 0
pulseLoop:
	
	mov	r0, #6
	b	Wait		//wait 6 useconds

	mov	r0, #0		//pass 0 to subroutine
	b 	Write_Clock	//falling edge
	
	mov	r0, #6
	b	Wait		//wait 6 useconds

	b	Read_Data	//read bit i

	
	lsl	r6, #1

	mov	r0, #0
	b	Write_Clock

	mov	r0, #6
	b 	Wait

	mov	r0, #1
	b	Write_Clock

	add	r5, #1

	cmp	r5, #16
	blt	pulseLoop

	pop {lr, r5, r6}
	bx 	lr


	
