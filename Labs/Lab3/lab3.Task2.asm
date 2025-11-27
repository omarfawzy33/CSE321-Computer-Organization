.data

fibNum: .asciiz "Enter your number"

.text 
main:

    li $v0, 4
    la $a0, fibNum
    syscall

    li $v0, 5
    syscall

    move $a0, $v0

    jal fibrec
    move $t0, $v0
    li $v0, 1
    move $a0, $t0
    syscall
    li $v0, 10
    syscall

fib: 

    li $t7,1
    bgt $a0, $t7, fibrec
    move $v0, $a0
    jr $ra

fibrec: 

    sub $sp, $sp,12
    sw $ra, 0($sp) # save ra 
 
    sw $a0, 4($sp)
    addi, $a0, $a0, -1 #n-1
    jal fib # fib(n-1)

    lw $a0, 4($sp)
    sw $v0, 8($sp)
    # addi $a0, $a0, 2 #return n
    addi $a0, $a0, -2 #n-2
    jal fib # fib(n-2)

    lw $t0, 8($sp)
    add $v0, $t0, $v0
 
    lw $ra, 0($sp)
    add $sp, $sp,12
    jr $ra