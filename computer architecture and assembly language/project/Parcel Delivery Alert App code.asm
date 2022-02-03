#MOHAMED MOUBARAK MOHAMED MISBAHOU MKOUBOI 1820705
#MD RAKIBUL HASSAN 1720465

#GROUP PROJECT on Parcel Delivery Alert App

			.data 
			
welcomemsg:	.asciiz "Welcome to our Parcel Delivery Alert App "
detectmsg:	.asciiz "\nWe have detected a delivery guy at the gate "
alertmsg:	.asciiz "\nThe recipient has alreay received an alert "
successfulmsg:.asciiz "\nSuccessfully verified .... "
opengatemsg: .asciiz "\nPlease open the gate ..... "
acceptmsg:	 .asciiz "\nParcel accepted "
thanksmsg:	 .asciiz "\nTHANKS FOR YOUR SERVICE!! "
getinput1:	.asciiz "\nPlease to enter the name of the recipient of the parcel: "
getinput2:	.asciiz "Please to enter the mahallah of the recipient of the parcel: "
verifymsg:		.asciiz "\nIs this your address? (Y/N)/(y/n) "
addressmsg:		.asciiz "\nIIUM Campus, Gombak, Kuala Lumpur "
buffer: 		.space 20


			.text
#	Print out a message string with a welcome message 

	 li $v0,4
        la $a0, welcomemsg
        syscall
	
#	Print out a message string with a detect message 

	 li $v0,4
        la $a0, detectmsg
        syscall

#	Print out a message string with an alert message 

	 li $v0,4
        la $a0, alertmsg
        syscall

#	Print out a message string with the message "Please to enter the name of the recipient of the parcel "
option1:
	 li $v0,4
        la $a0, getinput1
        syscall
	
#    Get an input from delivery guy to enter  the name of the recipient of the parcel

	  li $v0,8 #take in input
         la $a0, buffer #load byte space into address
         li $a1, 20 # allot the byte space for string
         move $t0,$a0 #save string to t0
         syscall

#	Print out a message string with the message "Please to enter the mahallah of the recipient of the parcel "
	 li $v0,4
        la $a0, getinput2
        syscall
	
#    Get an input from user to enter  the address of the recipient of the parcel

	  li $v0,8 #take in input
         la $a0, buffer #load byte space into address
         li $a1, 20 # allot the byte space for string
         move $t0,$a0 #save string to t0
         syscall

#	Print out a message string with the recipient user details 

	  la $a0,addressmsg #load and print "addressmsg" string
         li $v0,4
         syscall

	  la $a0, buffer #reload byte space to primary address
         move $a0,$t0 # primary address = t0 address (load pointer)
         li $v0,4 # print string
         syscall 
	 
#	Print out another message string to ask the recipient to select options either ‘Y’ or ‘N’ 
#     which means yes and no for verification of the identity

	 li $v0,4
        la $a0, verifymsg
        syscall

#	If the user selects N , the program loops to step 2. Otherwise, go to the next line.
#compare

	li $v0,12
	syscall
	li $t0, 'N'
	beq $t0,$v0,option1 #if user enters N, then go to option 1
	
	li $v0,12
	syscall
	li $t0, 'Y'
	beq $t0,$v0,option2 #if user enters Y, then go to option 2

option2:
#	Print out a message string with a successful message 

	li $v0,4
        la $a0, successfulmsg
        syscall

#	Print out a message string with an open gate t message 

	li $v0,4
        la $a0, opengatemsg
        syscall

#	Print out a message string with a accept parcel message 

	li $v0,4
        la $a0, acceptmsg
        syscall

#	Print out a message string with a thanks message 

	li $v0,4
        la $a0, thanksmsg
        syscall

#	End the code
	end:
	 li $v0,10
 	 syscall
	 
