#Mohamed Moubarak Mohamed Misbahou Mkouboi 1820705

.data
 	
 	message1: .asciiz "Welcome to Lab 1 exercise! This program will do addition of 2 numbers "       
  	n1:  .asciiz  "\nPlease enter a number between 0-9 : "
  	n2:  .asciiz  "Please enter the next number between 0-9 : "
       result: .asciiz "The result is : "
       message2: .asciiz "\nDo you want to continue? (Y/N) : "
 
.text

#step 1. printing prompt message
        li $v0,4
        la $a0, message1
        syscall
 
#step 2. getting first input.
 	main:
    	la $a0, n1
    	li $v0, 4
    	syscall
    	li $v0, 5
    	syscall
    	move $t0, $v0
    	
#step 3. getting second input.
    	la $a0, n2
   	li $v0, 4
   	syscall
    	li $v0, 5
    	syscall
    	move $t1, $v0
 	
#step 4. calculate and print out the result.
    	la $a0, result
   	li $v0, 4
    	syscall
    	add $t3, $t0, $t1
    	move $a0, $t3
    	li $v0, 1
    	syscall

#step 5.Print out another message string to ask whether the user wants to continue 
  	li $v0, 4
       la $a0, message2
       syscall
        
#step 6. If the user selects Y, the program loops to step 2. Otherwise, go to the next line
 	li $v0,12
	syscall
	li $t0, 'Y'
	beq $t0,$v0,main
	
#step 7. End the code
	end:
	 li $v0,10
 	 syscall
 	
 #procedure to print string
PrintString:
	li $v0,4
	syscall
	jr $ra