.data

choose: .asciiz "choose between 1 to 3: "
firstnum: .asciiz "Number 1 is choosen. "
secondnum: .asciiz "Number 2 is choosen. "
thirdnum: .asciiz "Number 3 is choosen. "
wrongnum: .asciiz "The number is wrong choose between 1 to 3."

.text
main:
    
    li $v0, 4
    la $a0, choose
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 1 

case1:

    bne $t0, $t1, case2  
    
    li $v0, 4
    la $a0, firstnum
    syscall

    j endCase

case2:

    add $t1, $t1, 1

    bne $t0, $t1, case3  
    
    li $v0, 4
    la $a0, secondnum
    syscall

    j endCase

case3:

    add $t1, $t1, 2

    bne $t0, $t1, endCase  
    
    li $v0, 4
    la $a0, thirdnum
    syscall

    j endCase

endCase:

exit:
    li $v0, 10
    syscall