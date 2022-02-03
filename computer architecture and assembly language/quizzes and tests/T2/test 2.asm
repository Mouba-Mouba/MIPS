#Mohamed Moubarak Mohamed Misbahou Mkouboi(1820705)

.text 
	#initialise number of apple of the 1st basket
	li $s1, 10
	
	#initialise number of apple of the 2nd basket
	li $s2, 10
	
	#initialise 3rd registers with 0 for the number of difference
	li $s3, 0
	
	#loop:
	#compare number of apple of the 1st basket  and number of apple of the 2nd basket,
	#if (1st register != 2nd register) --> find the difference
	sub $s3,$s1,$s2 		
	
	#if nothing had changed   
	#bne $s1,$s2, loop
	
	#compare number of apple of the 1st basket  and number of apple of the 2nd basket, 
	#if 1st register = 2nd register --> end the code
	#else stop: 
    	li $a0, 10
    	syscall