.data
name: .asciiz "Name:   Omar
ID:     1
Course: CSE-Computer-Organization"

.text
main:
    li $v0, 4
    la $a0, name
    syscall
    li $v0, 10
    syscall 