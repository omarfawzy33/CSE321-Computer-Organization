.data

fibNum: .asciiz "Enter your number: "

.text

fib:
#a0 Fibonacci number
    li $t0, 0   #a
    li $t1, 1   #b
    li $t2, 0   #next
    li $t3, 2   #i

for:

    bgt $t3, $a0, fib0or1   #if 0 =0 if 1 =1
    add $t2, $t0, $t1
    move $t0, $t1
    move $t1, $t2 
    addi $t3, $t3, 1

    j for

endFor:

    move $v0, $t2
    j returnFib

fib0or1:
    bne $a0, $zero, fib1
    move $v0, $t0
    j returnFib

fib1:
    move $v0, $t1

returnFib:
    jr $ra

main:

    addi $sp, $sp, -4
    sw $ra, 0($sp)

    li $v0, 4
    la $a0, fibNum
    syscall

    li $v0, 5
    syscall
    move $a0, $v0

    jal fib

    move $a0, $v0

    li $v0, 1
    syscall

returnMain:
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    jr $ra