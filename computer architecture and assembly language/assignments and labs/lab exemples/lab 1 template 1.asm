# Lab 1 exercise
# Put your comments here


	   .data 
variable1: .space 1 #to allocate space if necessary
string1:   .asciiz "Welcome to Lab 1 exercise! This program will do addition of 2 numbers \n" #message string
string2:   .asciiz "\nPlease enter a number between 0-9: " 
string3:   .asciiz "\nPlease enter the next number between 0-9: "
string4:   .asciiz "\nDo you want to continue? (Y/N) "

	   .text
#step 1. comment
	li $v0,4
	la $a0,string1
	syscall
#step 2. comment
	main:
	li $v0,4
	la $a0,string2
	syscall
#step 3. comment
	li $v0,5
	syscall
	move $s0, $v0
#step 4. comment
	li $v0,4
	la $a0,string3
	syscall
#step 5. comment
	li $v0,5
	syscall
	move $s1, $v0
#step 6. comment
	add $s2,$s1,$s0
	addu $s3,$s1,$s0
#step 7. comment
	li $v0,1
	move $a0, $s2
	syscall
#step 8. comment
	li $v0,4
	la $a0,string4
	syscall
#step 9. comment
	li $v0,12
	syscall
	li $t0, 'y'
	beq $t0,$v0,main
#step 10. End the code
	li $v0,10
	syscall

#procedure to print string
PrintString: