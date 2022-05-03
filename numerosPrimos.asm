.data
	msg: .asciiz "Ingrese un número: "
	msg1: .asciiz "El número "
	msg2: .asciiz " es no primo"
	msg3: .asciiz " es primo"

.text
	main:
		li $t0 0 #Para comparar el mod de la división
		li $t1 1 #El número que va aumentando para dividir al numero ingresado
		li $t3 1 #El número utilizado para ir aumentando los contadores, siempre será 1
		li $t4 0 #El contador de divisiones exactas
		li $t7 2 #Valor utilizado para hacer la comparación final
		
		la $a0 msg
		li $v0 4
		syscall
		
		li $v0 5
		syscall 
		move $t2 $v0 #t2 es el número ingresado
		add $t6 $t2 $t3 #Número utilizado para comparar el fin del ciclo
		j ciclo 
		
		
	ciclo:
		div $t2 $t1
		mfhi $t5 #$t5 resultado del mod de la division 
		beq $t5 $t0 cicloSi
		bne $t5 $t0 cicloNo
		
	cicloSi:
		add $t1 $t1 $t3
		add $t4 $t4 $t3
		beq $t1 $t6 finCiclo
		bne $t1 $t6 ciclo
		
	cicloNo:
		add $t1 $t1 $t3
		beq $t1 $t6 finCiclo
		bne $t1 $t6 ciclo
		
	finCiclo:
		bgt $t4 $t7 resultadoPositivo
		ble $t4 $t7 resultadoNegativo
	
	resultadoPositivo:
		la $a0 msg1
		li $v0 4
		syscall
		
		li $v0 1
		move $a0 $t2
		syscall
		
		la $a0 msg2
		li $v0 4
		syscall
		jr $ra
	
	resultadoNegativo:
		la $a0 msg1
		li $v0 4
		syscall
		
		li $v0 1
		move $a0 $t2
		syscall
		
		la $a0 msg3
		li $v0 4
		syscall
		jr $ra