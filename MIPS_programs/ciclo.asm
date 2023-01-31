.data 
	asterisco: .asciiz " * "
	signoIgual: .asciiz " = "
	separador: .asciiz "\n"

.text
	main:
		li $t0 1
		li $t1 1
		li $t2 10
		li $t3 1
		j ciclo
		
	ciclo:
		j subciclo
		li $v0 4
		la $a0 separador
		syscall
		j subciclo
		
		beq $t0 $t2 igual
		bne $t0 $t2 noIgual
		
	subciclo:
		mult $t3 $t0
		mflo $t4
		li $v0 1
		move $a0 $t3
		syscall
		li $v0 4
		la $a0 asterisco
		syscall
		li $v0 1
		move $a0 $t1
		syscall
		li $v0 4
		la $a0 signoIgual
		syscall
		li $v0 1
		move $a0 $t4
		syscall
		beq $t3 $t2 igualTabla
		bne $t3 $t2 noIgualTabla
		
	igualTabla:
		li $t3 1
		j ciclo 
		
	noIgualTabla:
		add $t3 $t3 $t1
		j subciclo
	
	igual:
		jr $ra
	
	noIgual:
		add $t0 $t0 $t1
		j ciclo