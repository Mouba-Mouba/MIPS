.text

	li	$t1,0x11		 		#initialise 1st register with 0x11
	li	$t2,0x15				#initialise 2nd and 4th register with 0x15
	li	$t3,0					#initialise 3rd with 0
	li	$t4,0x15
loop: 	
 	slt	$t1,$t1,$t3			#compare 1st and 3rd register, if (1st register <3rd register ) --> set 1st register 
 	xori	$t4,$t4,5			#xor 4th register with 0x5
 	bne	$t2,$t4,loop 	#compare 2nd and 4th register if (2nd register != 4th register ) -->loop
stop: