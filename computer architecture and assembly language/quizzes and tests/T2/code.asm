la	$t1,0x10010000
li	$t2,4
sub	$t2,$t4,$t3
xori	$t3,$t2,3 
and	$t3,$t1,$t1
sw	$t2,4($t3)
slt		$t5,$t2,$t1
add	$t3,$t4,$t2 