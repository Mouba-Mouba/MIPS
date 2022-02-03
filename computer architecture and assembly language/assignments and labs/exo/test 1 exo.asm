#Mohamed Moubarak Mohamed Misbahou Mkouboi 1820705

.data

     text1:  .asciiz "Hello. Please enter your matric number: "
     text2:  .asciiz  "\nWrong input format, please try again: "
     text3:  .asciiz  "Thanks for your input "

.text

 main:
    # Printing out the text
    li $v0, 4
    la $a0, text1
    syscall

    # Getting user input
    li $v0, 5
    syscall

    # Moving the integer input to another register
    move $t0, $v0

#If the user didn't put a matric number staring with 17, the program loops to ask him to put another number. Otherwise, go to the next line
	li $v0,12
	syscall
	li $t0, 17
	li $v0, 4
       la $a0, text2
       syscall
	beq $t0,$v0,main

#If the format is correct, print "Thanks for your input " 
  	li $v0, 4
       la $a0, text3
       syscall
    li $v0, 1
    move $a0, $t0
    syscall

    # End Program
    li $v0, 10
    syscall








