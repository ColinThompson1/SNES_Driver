// A subroutine to write a single bit to the GPIO latch line.
// Version 1.0

.section .text

.global

// @param r0: The value to write.
Write_Latch:
  push {r4, r5, r6}

  mov  r4, #9                     // Pin 9
  ldr  r5, =0x20200000            // Base GPIO
  mov  r6, #1                     // bit mask
  lsl r6, r4                      // Shift bit mask
  teq r0, #0                      // Test value of input
  streq r6, [r5, #40]             // GPCLR0
  strne r6, [r5, #28]             // GPSET0

  // Return to calling code.
  pop {r4, r5, r6}
  bx  lr
