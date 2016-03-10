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
	
	bl	EnableJTAG
	bl	InitUART
	//Initialize gpio lines
	mov	r0, #9
	ldr	r1, =20200000
	bl	Init_GPIO

	mov	r0, #10
	ldr	r1, =20200004
	bl	Init_GPIO

	mov	r0, #11
	ldr	r1, =20200004
	bl	Init_GPIO

	// Print names of creators
	mov 	r0, #13
	bl 	Print_Message

Begin:

	// Prompt for button press
	mov	r0,	#14
	push {lr}
	bl 	Print_Message
	pop {lr}

TryAgain:
	// Check for checked buttons. Bitmap returned in r0
	bl	Read_SNES2

	// Initiate counter to 0
  	// Mask to left most bit
  	// copy mask from Read_SNES to r7
	mov	r4, #16
	mov 	r5, #1
	mov	r7, r0

  	// Loop through each bit in mask and check if that bit's corresponding button
  	// was pressed.
	Loop:
		and	r6, r5, r7       // Isolate for left most bit
		cmp	r6, #0           // See if leftmost bit is selected
		beq	success

		lsr	r7, #1             // Move in next bit to check.
		sub	r4, #1             // Inc counter
		cmp 	r4, #0             // Check if its seen all buttons.
		bge	Loop               // If there are more buttons to check restart.

    		b TryAgain             // No button was pressed. Retry.


    success:
      	mov	r0, r4         		// If button is selected print the button type.
	push {lr}
	bl	Print_Message
	pop {lr}
      	b Begin              		// Restart input.



haltLoop$:
	b		haltLoop$
