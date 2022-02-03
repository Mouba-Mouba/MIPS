.data
 prompt: .asciiz "Welcome to Lab 1 exercise. \n"
 indata: .space 20
 plaintext: .asciiz "Please enter your name : "
 data: .space 40
 Key: .asciiz "Key ?"
 WrongKeyword: .asciiz "\nPlease enter a valid character"
 output: .asciiz "Hi Adam, your encrypted user name is "
.text
main:
start:
 # welcome message
 la $a0,prompt
 li $v0,4
 syscall
 # read the input
 
 # call procedure for Encryption 
     jal Plaintext
 
 # Wrong Key word Enetred
 la $a0,WrongKeyword
 li $v0,4
 syscall
 # Terminated Program if a wrong key word is entered
 li $v0,10
 syscall
 
Plaintext:
 # Read Plain text value
 la $a0,plaintext
 li $v0,4
 syscall
 la $a0,data
 la $a1,40  		# Maximum 40 characters can be read ( This value can be changed as prefer)
 li $v0,8
 syscall
 la $t0,($a0) 		# Entered string is stored in the t0 register
 li $t1,0 		# string length
 # Read Key
 la $a0,Key
 li $v0,4
 syscall
 li $v0,5
 syscall
 move $t3,$v0 		# stores the key value
 
 
 # Print the encrypted user name with a short message
 la $a0,output
 li $v0,4
 syscall
 
 
 
Encrypt:
 lb $t4, 0($t0)  	 	# The first character is read
 beq $t4,10,end 	 	# Terminate program on the \n 
 beqz $t4,end  			# Terminate Program when the end of the string is reached
 jal islower 
 
 
  			# Check if the character is lower case
Encrypt2:
 beq $v0,1,EncryptLower   	# EncryptLowercase characters
 beq $v0,0,EncryptUpper   	# EncryptUppercase characters
 move $a0, $t4   		# if the character is not upper or lower

PrintEncryptChar:
 li $v0,11 			# print the encrypted character
 syscall
 add $t0,$t0,1 			# Points to the next character
 add $t1,$t1,1 			# length is incremented
 j Encrypt
 
 
end:
 li $v0,10
 syscall
 
# For the use of Encryption

islower:
 bgt $t4,122,NotlowerOrupper	 	# if the character is not lower case or upper case
 blt $t4,97,IsupperORanyother 		# if the character is not lower case 
 li $v0,1   				# store value 1 in register V0 if the character is a lower case character
 jr $ra    	
 			# return back to the return address
NotlowerOrupper:
 li $v0,2   				# store value 2 in register VO if the character is not lower or upper
 j Encrypt2  
  				# jump back
IsupperORanyother:
 blt $t4,65,NotlowerOrupper		# if the character is not upper or lower
 bgt $t4,91,NotlowerOrupper 		# if character is not upper or lower
 li $v0,0   				# store value 0 in register V0 if the character is upper case
 j Encrypt2
 
EncryptLower:
 li $t5,26   				# Encrypt lower case characters
 sub $t4,$t4,97
 add $t4, $t4, $t3
 div $t4,$t5
 mfhi $a0
 addi $a0,$a0,97
 j PrintEncryptChar
 
EncryptUpper:
 li $t5,26   				# Encrypt Upper case characters
 sub $t4,$t4,65
 add $t4, $t4, $t3
 div $t4,$t5
 mfhi $a0
 addi $a0,$a0,65
 j PrintEncryptChar
 
li $v0, 10
syscall