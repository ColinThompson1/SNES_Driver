// A subroutine to read the button input from a SNES Controller and return the
// mask of hit buttons in r0

.section .text

.globl Read_SNES

Read_SNES:

  push {lr, r4, r5}
  mov  r4, #0         // Sampling buttons register.

  // WriteGPIO(CLOCK, #1) -- Initial pulse up
  mov r0, #1
  bl  Write_Clock

  // WriteGPIO(LATCH, #1) -- Pulse up
  mov r0, #1
  bl  Write_Latch

  // Wait(12μs)
  mov  r0, #12
  bl wait

  // WriteGPIO(LATCH, #0) -- Pulse down
  mov  r0, #0
  bl  Write_Latch

  mov  r5, #0      // Initialize counter to 0

  PulseLoop:
    lsl r4, #1       // Make room for next bit

    mov  r0, #6      // Wait(6μs)
    bl  wait

    mov r0, #0       // WriteGPIO(CLOCK, #0)
    bl  Write_Clock

    mov  r0, #6      // Wait(6μs)
    bl  wait

    b Read_Data      // Read bit i
    or r4, r0        // Copy in read bit

    mov r0, #1       // WriteGPIO(CLOCK, #1)
    bl  Write_Clock

    add  r5, #1

    cmp  r5, 16      // Check if counter < 16
    blt  PulseLoop

  mov  r0, r4        // Copy r4 to r0 for return
  pop {lr, r4, r5}
  bx lr
