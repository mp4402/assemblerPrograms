.data
palabra: .space 20
bajada: .asciiz "\n"

.text
main:
    li $v0, 8
    li $a1, 20
    la $a0, palabra
    syscall

    li $v0, 4
    li $t0, 0

loop:
    lb $t1, palabra($t0)
    beq $t1, 0, fin
    blt $t1, 'a', operador
    bgt $t1, 'z', operador
    sub $t1, $t1, 32
    sb $t1, palabra($t0)

operador: 
    addi $t0, $t0, 1
    j loop

fin:
    li $v0, 4
    la $a0, palabra
    syscall

    li $v0, 10
    syscallg