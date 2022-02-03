#exercise for test1
#convert 5 letter word to capital letters
.data
welcomemsg:	.asciiz "Welcome to capitalise your word "
enteraword:	.asciiz"\nPlease enter a word of 5 characters (using small letters only) "
word:.space 6
WORD:.space 6
.text
#a.	Prompt a welcoming message to the user (“Welcome to capitalise your word”) 
la	$a0,welcomemsg
jal	printstring

#b.	Prompt a message to the user to enter a word. The word must be of exactly 5 characters of small letters only. (e.g. water)				
la	$a0,enteraword
jal	printstring

li	$v0,8
la	$a0,word
li	$a1,6
syscall

#c.	Manipulate the word by changing the 5 characters to be all capital letters. (e.g. WATER) 
li	$t3,0
li	$t2,0
loop:
lb	 $t1,word($t2)
sub	$t1,$t1,0x20
sb	$t1,WORD($t2)
add	$t2,$t2,1
bne	$t2,5,loop
#d.	Prompt the user with the manipulated word. (e.g. WATER)		
la	$a0,WORD	
jal	printstring

#end
li	$v0,10
syscall

#e.	Optimise the code to use procedures whenever possible (at least 1 procedure). 
printstring:
li	$v0,4
syscall
jr	$ra

