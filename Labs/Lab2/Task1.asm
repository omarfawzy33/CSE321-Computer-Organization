.data

firstnum: .asciiz "Enter first number: "
secondnum: .asciiz "Enter second number: "
thirdnum: .asciiz "Enter third number: "
fourthnum: .asciiz "Enter fourth number: " 
average: .asciiz "The average = "

.text
main:

    li $v0, 4
    la $a0, firstnum
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 

    li $v0, 4
    la $a0, secondnum
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    add $t1, $t1, $t0 

    li $v0, 4
    la $a0, thirdnum
    syscall

    li $v0, 5
    syscall
    move $t2, $v0

    add $t2, $t2, $t1

    li $v0, 4
    la $a0, fourthnum
    syscall

    li $v0, 5
    syscall
    move $t3, $v0

    add $t3, $t3, $t2

    srl $t3, $t3, 2

    li $v0, 4
    la $a0, average
    syscall

    move $a0, $t3

    li $v0, 1
    syscall   

exit:
    li $v0, 10
    syscall
