// A subroutine to initialize a GPIO line, after being given a line and function
// code. (initializes the LATCH, DATA, and CLOCK lines only)
// Version 1.0

.section .text

.globl Init_GPIO

// @param r0: The line number to initialize.
// @param r1: The GPFSEL(n) which corresponds to the line.
Init_GPIO:

  push {r4, r5, r6, r7}
  ldr  r4, [r1]                 // GPFSEL(n)
  mov  r6, #7                   // b0111

  // Determine how much to shift the bit mask by given the GPIO pin number.
  // ie. (x * 3) + 2 [to account for reserved bits] => 32 - ans [the 'offset' from
  // respective edges of the register]. Finally if offset >= 0 [even GPFSEL
  // registers] than subtract 30 to adjust to the correct side of the register.
  mov r2, #3
  mul r0, r2, r5
  add  r5, #2
  mov r2, #32
  subs  r5, r2, r5

  ble Odd_GPFSEL
    // Calculate the absolute value.
    cmp     r5, #0

    rsblt   r5, r5, #0

    // Get corrected offset.
    mov r2, #30
    sub  r5, r2, r5
    b Next

  Odd_GPFSEL:
    cmp     r5, #0
    rsblt   r5, r5, #0

  // Shift and use bit mask.
  Next:
    lsl r6, r5
    bic r4, r6

    // If the 10 pin (input) than skip writing the output code. This makes the
    // subroutine work with only the three specified pins.
    cmp  r0, #10
    beq writeBack

    // Output function code
    mov  r7, #1
    lsl r7, r5
    orr r4, r7

  // Write back the output function code - unless input initialization. Then
  // return to the calling code.
  writeBack:
    str  r4, [r1]
    bx lr
