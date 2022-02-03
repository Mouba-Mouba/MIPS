.data
        string1:     .asciiz         "\nEnter a 6 letter string:\n"
        string2:    .asciiz         "\nWelcome to letter game\n"
        output:        .asciiz         "\nOutput:\n"
        user_input:          .space          6

.text
.globl  main
    
main:
        # print out the user prompt
        li      $v0,4
        la      $a0,string2
        syscall
        
        # print out the user prompt
        li      $v0,4
        la      $a0,string1
        syscall

        # obtain a string to scan
        li      $v0,8
        la      $a0,user_input
        li      $a1,6
        syscall
        
        li $t0, 0

loop:
    lb $t1, user_input($t0)  # Get the character saved at the current place using the $t0 value.
    beq $t1, 0, exit
    
    li $t4, 96          #lower limit - small ascii's ascii value a - 1 
    sgt $t2, $t1, $t4   # If char is bigger than or equal to 'a,' $t2 equals 1.
    
    li $t4, 124         #lower limit -  small ascii's ascii value z - 1
    slt $t3, $t1, $t4   # If char is less than or equal to 'z,' $t2 equals 1.
    
    and $t4, $t2, $t3   #Check to see if both of the above conditions are met.
    beq $t4, 1, lower_case      # go to the lower case block
    
    li $t4, 64          #lower limit - ascii value A - 1
    sgt $t2, $t1, $t4   #If char is larger than or equal to 'A,' $t2 equals 1.

    
    li $t4, 92          # lower limit - ascii value Z - 1
    slt $t3, $t1, $t4   # If char is less than or equal to 'Z,' $t2 equals 1.
    
    and $t4, $t2, $t3   #Check to see if both of the above conditions are met.
    beq $t4, 1, upper_case      # go to the upper case block


lower_case:
	  sub $t1, $t1, 32	
        sb $t1, user_input($t0)      # Save at the current address of the input
        addi $t0, $t0, 1
        j loop

upper_case:
        sb $t1, user_input($t0)
        addi $t0, $t0, 1
        j loop
    
exit:
        # Message to be printed
        li $v0, 4
        la $a0, output
    syscall
    
    # output string to print
    li $v0, 4
    la $a0, user_input
    syscall

    li $v0, 10
    syscall