# Lab 1 exercise
# Put your comments here


	   .data 
variable1: .space 1 #to allocate space if necessary
string1:   .asciiz "Welcome to Lab 1 exercise! This program will do addition of 2 numbers" #message string
string2:   .asciiz "\nPlease enter a number between 0-9: " 
string3:   .asciiz "Please enter the next number between 0-9: "
string4:   .asciiz "\nDo you want to continue? (Y/N) "
stringPlus:  .asciiz " + "
stringEqual: .asciiz " = "

	   .text
#step 1. Print Greeting message
	la $a0,string1
	jal PrintString
#step 2. asks th user to enter Integer1
   main:
   integer1:
	la $a0,string2
	jal PrintString		
#step 3. Reads Integer1 from the user
	jal ReadInteger		
	move $a1, $v0
	bltz $a1, integer1
	slti $t0, $a1, 10
	beq  $t0, $zero, integer1
#step 4. asks th user to enter Integer2
   integer2:
	la $a0,string3
	jal PrintString	
#step 5. Reads Integer2 from the user
	jal ReadInteger	
	move $a2, $v0
	bltz $a2, integer2
	slti $t0, $a2, 10
	beq  $t0, $zero, integer2
#step 6. Caculate the add resutls
	jal AddNumbers
#step 7. Print addition result
	move $a0, $a1	
	jal PrintInteger #print Integer1
	
	la $a0,stringPlus
	jal PrintString #prints " + "

	move $a0, $a2
	jal PrintInteger #print Integer2
	
	la $a0,stringEqual
	jal PrintString #prints " = "
	
	move $a0, $v1
	jal PrintInteger #print result 
#step 8. #print (Y/N)
   decision:
	la $a0,string4
	jal PrintString		
#step 9. comment
	li $v0,12
	syscall		#Read decision from user
	li $t0, 'y'
	beq $t0,$v0,main 
	li $t0, 'Y'
	beq $t0,$v0,main
	li $t0, 'n'
	beq $t0,$v0,end
	li $t0, 'N'
	beq $t0,$v0,end
	j decision 
#step 10. End the code
   end:
	li $v0,10
	syscall		#End the Program

#procedure to print string
PrintString:
	li $v0,4
	syscall
	jr $ra

PrintInteger:
	li $v0,1
	syscall
	jr $ra

ReadInteger:
	li $v0,5
	syscall
	jr $ra
	
AddNumbers:
	add $v1,$a1,$a2
	jr $ra
