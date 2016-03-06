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

haltLoop$:
	b		haltLoop$



// *** SUBROUTINES *** \\
