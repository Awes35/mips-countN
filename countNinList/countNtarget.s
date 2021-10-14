        # Program to count number of times value (target) occurs in stored list of N integers.
        # target and N internally stored at memory locations labeled "target" and "arraySize"
        #       Written by Kollen Gruizenga
            
        .data
        .align  2
target:	.word   10
arraySize:.word	8
values:	.word	23,10,30,10,30,20,423,302

#---------------------------------------------------

        .text
        .globl  main

main:   move    $s0, $0		# s0: index = 0
        move    $s1, $0		# s1: running count = 0
        la      $s7, arraySize	# s7: address of number of values in list (n)
        lw	$s3, 0($s7)	# s3: value of arraySize
        la	$s7, target	# s7: address of target value to find
        lw	$s4, 0($s7)	# s4: value of target to find
        #la	$s7, values	# s7: address of values

loop:   bge     $s0, $s3, done	# while (index < n)
        sll     $t0, $s0, 2	# convert array index into memory offset
        lw      $t1, values($t0)# t0 = next value in list
        bne	$t1, $s4, else	# if curr value = target value
        addi	$s1, $s1, 1	#count++
        addi	$s0, $s0, 1	#index++
        J loop
else: 	addi	$s0, $s0, 1	#index++
	J loop

        
done:   move    $a0, $s1	# display count of target occurrences
        li      $v0, 1
        syscall
        
        li      $v0, 10		# TTFN
        syscall
