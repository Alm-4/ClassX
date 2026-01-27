.global	count
.text
count:
	subui	$sp, $sp, 9
	sw	$7, 1($sp)
	sw	$11, 2($sp)
	sw	$12, 3($sp)
	sw	$13, 4($sp)
	sw	$ra, 5($sp)
	addu	$7, $0, $0
	lw	$13, 9($sp)
	sw	$13, 8($sp)
	addui	$12, $0, 10000
	sge	$13, $13, $12
	bnez	$13, L.6
	addu	$13, $0, $0
	sw	$13, 7($sp)
	lw	$11, 8($sp)
	slt	$13, $11, $13
	bnez	$13, L.6
	lw	$13, 10($sp)
	sw	$13, 6($sp)
	sge	$13, $13, $12
	bnez	$13, L.6
	lw	$13, 7($sp)
	lw	$12, 6($sp)
	sge	$13, $12, $13
	bnez	$13, L.2
L.6:
	j	L.1
L.2:
	lw	$13, 9($sp)
	lw	$12, 10($sp)
	sne	$13, $13, $12
	bnez	$13, L.7
	lw	$13, 9($sp)
	sw	$13, 0($sp)
	jal	writessd
	j	L.8
L.7:
	lw	$13, 9($sp)
	lw	$12, 10($sp)
	sge	$13, $13, $12
	bnez	$13, L.9
	lw	$7, 9($sp)
	j	L.14
L.11:
	sw	$7, 0($sp)
	jal	writessd
	jal	delay
L.12:
	addi	$7, $7, 1
L.14:
	lw	$13, 10($sp)
	sle	$13, $7, $13
	bnez	$13, L.11
	j	L.10
L.9:
	lw	$7, 9($sp)
	j	L.18
L.15:
	sw	$7, 0($sp)
	jal	writessd
	jal	delay
L.16:
	subi	$7, $7, 1
L.18:
	lw	$13, 10($sp)
	sge	$13, $7, $13
	bnez	$13, L.15
L.10:
L.8:
L.1:
	lw	$7, 1($sp)
	lw	$11, 2($sp)
	lw	$12, 3($sp)
	lw	$13, 4($sp)
	lw	$ra, 5($sp)
	addui	$sp, $sp, 9
	jr	$ra
