//RaspberryPie SNES Controller Driver -- Assignment 3 CPSC 359
//Author: Lillian Iwaniszyn, Stuart Seguin, Colin Thompson
//Version 1.0


.section    .init
.globl     _start

_start:
    b       main

.section .text

main:
    mov     sp, #0x8000

	bl		EnableJTAG
	bl 		Read_SNES
	
	// Print names of creators 
	mov 	r0, #13 		
	bl 		Print_Message

Begin:

	// Prompt for button press
	mov		r0,	#14
	bl 		Print_Message
	
	// Check for checked buttons. Bitmap returned in r0
	bl		Read_SNES
	
	// Initiate counter to 0 and mask to left most bit and the bitmap to r7
	mov		r4, #0
	mov 	r5, #1
	mov		r7, r0
	Loop:
		and		r6, r5, r7
		cmp		r6, r5
		bne		fail
		
		mov		r0, r4
		bl		Print_Message
		
		
		fail:
		
		lsr	r7, #1
		add	r4, #1 //inc
		cmp r4, #16
		ble	Loop
		b 	Begin
		
	


haltLoop$:
	b		haltLoop$



// *** SUBROUTINES *** \\
