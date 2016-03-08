.section .text
// this subroutine displays the right argument based on r0 as a parameter

.globl Print_Message

Print_Message:
	push {lr}
	mov	r1, #14		
	cmp	r4, r1
	bne printNames
	ldr	r0, =button_prompt
	mov	r1, #23
	bl	WriteStringUART
	b done
printNames:	
	mov r1, #13
	cmp	r4, r1
	bne bButton
	ldr	r0, =names
	mov	r1, #63
	bl	WriteStringUART
	b done
bButton:
	mov r1, #0
	cmp	r4, r1
	bne yButton
	ldr	r0, =b_button
	mov	r1, #15
	bl	WriteStringUART
	b done	

yButton:
	mov	r1,	#1
	cmp r4, r1
	bne selButton
	ldr	r0, =y_button
	mov	r1, #15
	bl	WriteStringUART
	b done
selButton:
	mov	r1,	#2
	cmp r4, r1
	bne startButton
	ldr	r0, =select_button
	mov	r1, #20
	bl	WriteStringUART
	b done
startButton:
	mov	r1,	#3
	cmp r4, r1
	bne upButton
	ldr	r0, =start_button
	mov	r1, #23
	bl	WriteStringUART
	b halt
upButton:
	mov	r1,	#4
	cmp r4, r1
	bne downButton
	ldr	r0, =up_button
	mov	r1, #16
	bl	WriteStringUART
	b done
downButton:
	mov	r1,	#5
	cmp r4, r1
	bne leftButton
	ldr	r0, =down_button
	mov	r1, #18
	bl	WriteStringUART
	b done
leftButton:
	mov	r1,	#6
	cmp r4, r1
	bne rightButton
	ldr	r0, =left_button
	mov	r1, #18
	bl	WriteStringUART
	b done
rightButton:
	mov	r1,	#7
	cmp r4, r1
	bne aButton
	ldr	r0, =right_button
	mov	r1, #19
	bl	WriteStringUART
	b done
aButton:
	mov	r1,	#8
	cmp r4, r1
	bne xButton
	ldr	r0, =a_button
	mov	r1, #15
	bl	WriteStringUART
	b done
xButton:
	mov	r1,	#9
	cmp r4, r1
	bne lButton
	ldr	r0, =x_button
	mov	r1, #15
	bl	WriteStringUART
	b done
lButton:
	mov	r1,	#10
	cmp r4, r1
	bne rButton
	ldr	r0, =l_button
	mov	r1, #15
	bl	WriteStringUART
	b done
rButton:
	mov	r1,	#11
	cmp r4, r1
	bne done 
	ldr	r0, =r_button
	mov	r1, #15
	bl	WriteStringUART
done:
	
	pop {lr}
	mov	pc, lr

halt:
	b	halt
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
