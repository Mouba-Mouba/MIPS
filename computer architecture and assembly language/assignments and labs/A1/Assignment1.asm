	.data
numbers: .byte 11,12,13,14
string1: .asciiz "Hello World"

	.text
	li	$v0,4
	la	$a0,string1
	syscall
	li	$v0,10
	syscall
