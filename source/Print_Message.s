// This subroutine displays a button which is based on r0 as a parameter.
.section .text

.globl Print_Message
//
Print_Message:
	push {lr, r4, }

	mov	r4, #14
	cmp	r0, r4
	bne printNames
	ldr	r0, =button_prompt
	mov	r4, #23
	bl	WriteStringUART
	b done
printNames:
	mov r4, #13
	cmp	r0, r4
	bne bButton
	ldr	r0, =names
	mov	r4, #63
	bl	WriteStringUART
	b done
bButton:
	mov r4, #0
	cmp	r0, r4
	bne yButton
	ldr	r0, =b_button
	mov	r4, #15
	bl	WriteStringUART
	b done
yButton:
	mov	r4,	#1
	cmp r0, r4
	bne selButton
	ldr	r0, =y_button
	mov	r4, #15
	bl	WriteStringUART
	b done
selButton:
	mov	r4,	#2
	cmp r0, r4
	bne startButton
	ldr	r0, =select_button
	mov	r4, #20
	bl	WriteStringUART
	b done
startButton:
	mov	r4,	#3
	cmp r0, r4
	bne upButton
	ldr	r0, =start_button
	mov	r4, #23
	bl	WriteStringUART
	b halt
upButton:
	mov	r4,	#4
	cmp r0, r4
	bne downButton
	ldr	r0, =up_button
	mov	r4, #16
	bl	WriteStringUART
	b done
downButton:
	mov	r4,	#5
	cmp r0, r4
	bne leftButton
	ldr	r0, =down_button
	mov	r4, #18
	bl	WriteStringUART
	b done
leftButton:
	mov	r4,	#6
	cmp r0, r4
	bne rightButton
	ldr	r0, =left_button
	mov	r4, #18
	bl	WriteStringUART
	b done
rightButton:
	mov	r4,	#7
	cmp r0, r4
	bne aButton
	ldr	r0, =right_button
	mov	r4, #19
	bl	WriteStringUART
	b done
aButton:
	mov	r4,	#8
	cmp r0, r4
	bne xButton
	ldr	r0, =a_button
	mov	r4, #15
	bl	WriteStringUART
	b done
xButton:
	mov	r4,	#9
	cmp r0, r4
	bne lButton
	ldr	r0, =x_button
	mov	r4, #15
	bl	WriteStringUART
	b done
lButton:
	mov	r4,	#10
	cmp r0, r4
	bne rButton
	ldr	r0, =l_button
	mov	r4, #15
	bl	WriteStringUART
	b done
rButton:
	mov	r4,	#11
	cmp r0, r4
	bne done
	ldr	r0, =r_button
	mov	r4, #15
	bl	WriteStringUART
done:
	pop {lr, r4}
	mov	pc, lr

.section .data

// all the ascii strings used
names:
	.ascii	"Created by: Stuart Seguin, Colin Thompson and Lillian Iwaniszyn\r"
button_prompt:
	.ascii	"\r\nPlease press a button... \n"
b_button:
	.ascii	"\r\nYou pressed B"
y_button:
	.ascii	"\r\nYou pressed Y"
up_button:
	.ascii	"\r\nYou pressed Up"
left_button:
	.ascii	"\r\nYou pressed Left"
down_button:
	.ascii	"\r\nYou pressed Down"
right_button:
	.ascii	"\r\nYou pressed Right"
select_button:
	.ascii	"\r\nYou pressed Select"
start_button:
	.ascii	"\r\nTerminating Program..."
a_button:
	.ascii	"\r\nYou pressed A"
x_button:
	.ascii	"\r\nYou pressed X"
l_button:
	.ascii	"\r\nYou pressed L"
r_button:
	.ascii	"\r\nYou pressed R"
