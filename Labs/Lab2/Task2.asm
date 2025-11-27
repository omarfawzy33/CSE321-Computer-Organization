.data

number: .asciiz "Enter no. of integers: "
prompt: .asciiz "Enter your integers: "
average: .asciiz "The average = "

.text
main:

    li $v0, 4
    la $a0, number
    syscall

    li $v0, 5
    syscall
    move $t0, $v0      #no of integers

    li $t1, 1
    li $t2, 0
    add $t0, $t0, 1

while:
    
    beq $t1, $t0, endWhile

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t3, $v0       #integers

    addu $t2, $t2, $t3

    add $t1, $t1, 1
    j while

endWhile:

    sub $t0, $t0, 1

    divu $t2, $t0
    mflo $t4

    li $v0, 4
    la $a0, average
    syscall

    move $a0, $t4  

    li $v0, 1
    syscall  

exit:
    li $v0, 10
    syscall 