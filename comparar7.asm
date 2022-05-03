.data
	msg: .asciiz "Ingrese un valor: " 
	msg1: .asciiz  "Es igual a 7"
	msg2: .asciiz "Es diferente de 7"
	
.text
	main:
		la $a0 msg
		li $v0 4
		syscall
		
		li $v0 5
		syscall 
		move $t0 $v0
		
		li $t1 7
		
		beq $t0 $t1 correcto
		bne $t0 $t1 incorrecto
		
	correcto:
		li $v0 4
		la $a0 msg1
		syscall 
		j fin_if
		
	incorrecto:
		li $v0 4
		la $a0 msg2
		syscall
		j fin_if
		
	fin_if:
		jr $ra