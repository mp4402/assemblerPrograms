.data    #data section
     palabra: .asciiz "rotores"
     largo_palabra: .word 7
     es_str: .asciiz " si"
     no_str: .asciiz " no"
     palindromo: .asciiz " es palindromo"

.text    #code Section
    main:
	la $a0, largo_palabra
	lw $a0, 0($a0)
	la $a1, palabra
	jal ejecutor
	add $a0, $v0, $zero
	jal Respuesta
	addi $v0, $zero, 10
	syscall


    ejecutor:
	# Caso Base
	slti $t0, $a0, 2
	bne $t0, $zero, Verdadero

	# Primero y ultimo
	lb $t0, 0($a1)
	addi $t1, $a0, -1
	add $t1, $t1, $a1
	lb $t1, 0($t1)
	bne $t0, $t1, Falso
	
	# Mover puntero, largo y recursividad
	addi $a0, $a0, -2
	addi $a1, $a1, 1
	j ejecutor
	
    Falso:
	addi $v0, $zero, 0
	jr $ra

    Verdadero:
	addi $v0, $zero, 1
	jr $ra

    Respuesta:
	add $t4, $a0, $zero
	addi $v0, $zero, 4
	la $a0, palabra
	syscall
	la $a0, es_str
	syscall
	bne $t4, $zero, Contador
	la $a0, no_str
	syscall

    Contador:
	la $a0, palindromo
	syscall
	jr $ra