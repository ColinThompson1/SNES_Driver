// A subroutine to read a single bit to the GPIO data line.
// Version 1.0

.section .text

.globl Read_Data

Read_Data:
  push {r4, r5, r6}

  mov  r4, #10                    // Pin 10 - DATA
  ldr  r5, =0x20200000            // Base GPIO
  ldr  r5, [r5, #52]              // load GPLEV0 register
  mov  r6, #1                     // bit mask
  lsl r6, r4                      // Shift bit mask
  and r5, r6                      // Mask to check for 1/0 check
  teq r5, #0                      // Test value of input
  moveq r0, #0                    // If it contains a 0, return it.
  movne r0, #1                    // If it contains a 1, return it.

  // Return to calling code.
  pop {r4, r5, r6}
  bx  lr
