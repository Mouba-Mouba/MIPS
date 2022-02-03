#Mohamed Moubarak Mohamed Misbahou Mkouboi(1820705)
.text
	#initialise 1st register with 5
	li $s1, 5
	
	#initialise 2nd register with 0x15
	li $s2, 0x15
	
	#initialise 3rd and 4th registers with 0
	li $s3, 0
	li $s4, 0
	
	loop:
	#compare 1st and 3rd register, if 1st register<3rd register --> set 1st register
	slt $s1,$s1,$s3
	
	#increment 4th register by 2
	addi $s4, $s4, 2 		
	
	#compare 2nd and 4th registers if (2nd register != 4th register) ->loop   
	bne $s2,$s4, loop
	
	#else stop: exit prog
    	li $a0, 10
    	syscall