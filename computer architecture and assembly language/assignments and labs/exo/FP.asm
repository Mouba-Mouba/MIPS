	.data
	nums:   .float  0.75,15.25,7.625
	.text
	
main:	add.s  $f0,$f8,$f10
	sub.d  $f0,$f8,$f10	
	mfc1	$t0,$f2
	neg.s	$f6,$f16
	la 		$t0, nums
	lwc1 		$f0, 0($t0)
	lwc1 		$f1, 4($t0)
	add.s 	$f2, $f0, $f1

#0.75 + 15.25 = 16.0 = 10000 binary = 1.0 * 2^4
#f2: 0  10000011 000000... = 0x41800000

	swc1 $f2,12($t0)

#1001000C now contains that number

	bc1t   main		 # branch on fp flag true
	#bc1f   main		 # branch on fp flag false
	c.eq.s $f0,$f8	 # if ($f0)=($f8), set flag to “true”
	c.lt.s $f0,$f8	 # if ($f0)<($f8), set flag to “true”
	c.le.s $f0,$f8	 # if ($f0)<=($f8), set flag to “true”
	cvt.s.w	$f0,$f8
	li	$v0,10
	syscall
