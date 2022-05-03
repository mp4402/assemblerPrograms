.data
	msg1: .asciiz "Ingrese un número: "
	msg2: .asciiz "\n"
	
.text
	main:
		addi $sp $sp -20
		addi $t1 $sp 0 #t1 utilizado para moverse dentro del vector
		addi $t3 $sp 0
		li $t2 0 #t2 utilizado para contar el número de números ingresados
		j ingresoNumeros
	
	#Ingreso de los 5 números
	ingresoNumeros:
		#Cara e impresión del mensaje 
		la $a0 msg1
		li $v0 4
		syscall
		
		li $v0 5
		syscall 
		move $t0 $v0
		
		sw $t0 0($t1)
		addi $t1 $t1 4
		
		add $t2 $t2 1
		beq $t2 5 ordenado
		bne $t2 5 ingresoNumeros
	
	ordenado:
		addi $t1 $t1 -8
		addi $t4 $t1 0
		addi $t3 $t1 4
		j ciclo
		
	ciclo:
		addi $t1 $t1 4
		lw $t0 0($t1)
		lw $t5 0($t4)
		blt $t5 $t0 cicloSi
		bgt $t5 $t0 comparadorCiclo
		
	cicloSi:
		sw $t0 0($t4)
		sw $t5 0($t1)
		j comparadorCiclo 
		
	comparadorCiclo:
		bgt $t1 $t3 moverT4
		blt $t1 $t3 ciclo
	
	moverT4:
		addi $t4 $t4 -4
		addi $t1 $t4 0
		blt $t4 $sp impresion 
		bgt $t4 $sp ciclo
	
	impresion:
		move $t1 $t3
		lw $t0 0($t1)
		
		li $v0 1
		move $a0 $t0
		syscall
		
		addi $t1 $t1 -4
		
		la $a0 msg2
		li $v0 4
		syscall
		
		lw $t0 0($t1)
		
		li $v0 1
		move $a0 $t0
		syscall
		
		addi $t1 $t1 -4
		
		la $a0 msg2
		li $v0 4
		syscall
		
		lw $t0 0($t1)
		
		li $v0 1
		move $a0 $t0
		syscall
		
		addi $t1 $t1 -4
		
		la $a0 msg2
		li $v0 4
		syscall
		
		lw $t0 0($t1)
		
		li $v0 1
		move $a0 $t0
		syscall
		
		addi $t1 $t1 -4
		
		la $a0 msg2
		li $v0 4
		syscall
		
		lw $t0 0($t1)
		
		li $v0 1
		move $a0 $t0
		syscall
		
		j fin
	
	fin:
		jr $ra