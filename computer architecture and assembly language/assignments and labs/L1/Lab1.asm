# Lab 1 exercise sample answer

#1.	Print out a message string with a welcome message "Welcome to Lab 1 exercise! This program will do addition of 2 numbers "
#2.	Print out a message string with the message "Please enter a number between 0-9 "
#3.	Get an input from user to enter a number from 0-9
#4.	Print out another message string with the message "Please enter the next number between 0-9 "
#5.	Get an input from user to enter a number from 0-9
#6.	Do the process of addition and get the result.
#7.	Print out a message string with the input numbers and result (e.g. "4 + 8 = 12")
#8.	Print out another message string to ask whether the user wants to continue “Do you want to continue? (Y/N)"
#9.	If the user selects Y, the program loops to step 2. Otherwise, go to the next line.
#10.	End the code
#11.	Optimise the code using procedures whenever possible.
#12.	Put relevant comments. Comments should include: 
#13.	Use meaningful variable names/labels.
#14.	Advanced level (optional):
#•	Input validation for steps 3, 5 and 8


			.data 
welcomemsg:	.asciiz "Welcome to Lab 1 exercise. \nThis program will do addition of 2 numbers "
getinput1:	.asciiz "\nPlease enter a number between 0-9 "
getinput2:	.asciiz "\nPlease enter the next number between 0-9 "
contmsg:	.asciiz "\nDo you want to continue? (Y/N) "
wrongmsg:	.asciiz "\nPlease enter the correct number between 0-9 "
wrongchar:.asciiz "\nWrong input. "


			.text
#1.	Print out a message string with a welcome message 
#syscall print string

	la	$a0,welcomemsg
	jal	PrintString

#2.	Print out a message string with the message "Please enter a number between 0-9 "
prog:
	la	$a0,getinput1
	jal	PrintString
	
#3. Get an input from user to enter a number from 0-9
#syscall read integer
togetinput1:
	li	$v0,5
	syscall
	addi	$s1,$v0,0 #s1 contains input1
	#input1 validation

	blt	$s1,10,correctinput1lvl1#(input is <10)
	la	$a0,wrongmsg
	jal	PrintString
	j	togetinput1
correctinput1lvl1:
   bgez $s1,correctinput1lvl2#(input is >=0)
	la	$a0,wrongmsg
	jal	PrintString
	j	togetinput1

correctinput1lvl2:
#4.	Print out a message string with the message "Please enter the next number between 0-9 "
	la	$a0,getinput2
	jal	PrintString
	
#5. Get an input from user to enter a number from 0-9
#syscall read integer
togetinput2:
	li	$v0,5
	syscall
	addi	$s2,$v0,0 #s2 contains input2
	
	#input2 validation (input is between 0-9)
	
	blt	$s2,10,correctinput2lvl1 #(input is <10)
	la	$a0,wrongmsg
	jal	PrintString
	j	togetinput2
correctinput2lvl1:
    bgez $s2,correctinput2lvl2#(input is >=0)
	la	$a0,wrongmsg
	jal	PrintString
	j	togetinput2
correctinput2lvl2:

#6. Do the process of addition and get the result.
	add	$t1,$s1,$s2 #result is in $t1

#7.	Print out a message string with the input numbers and result (e.g. "4 + 8 = 12")
#print input1 ($s1)

	addi	$a0,$s1,0
	jal	PrintInt
#print +
	li $a0,'+'
	jal	PrintChar

#print input2 ($s2)
	
	addi	$a0,$s2,0
	jal	PrintInt

#print =
	li	$a0,'='
	jal	PrintChar

#print result ($t1)
	
	addi	$a0,$t1,0
	jal	PrintInt

#8.	Print out another message string to ask whether the user wants to continue “Do you want to continue? (Y/N)"
checkcontinue:
	la	$a0,contmsg
	jal	PrintString

#9.	If the user selects Y or y, the program loops to step 2. Otherwise, go to the next line.
#syscall getchar
	li	$v0,12
	syscall

#compare
	addi	$t2,$v0,0
	beq	$t2,'Y',prog #if user enters Y, then go to prog
	beq	$t2,'y',prog #if user enters y, then go to prog
	beq	$t2,'N',endprog #if user enters N, then go to endprog
 	beq	$t2,'n',endprog #if user enters n, then go to endprog
	la	$a0,wrongchar
	jal	PrintString
	j	checkcontinue
#10.	End the code
#syscall exit code
endprog:
	li	$v0,10
	syscall

PrintString:
	li	$v0,4
	syscall
	jr	$ra
	
#procedure print char
PrintChar:
	li	$v0,11
	syscall
	jr	$ra

#procedure print integer
PrintInt:
	li	$v0,1
	syscall
	jr	$ra
