.data
	msg1: .asciiz "Ingrese el primer número: "
	msg2: .asciiz "Ingrese el segundo número: "
	msg3: .asciiz "Ingrese el tercer número: "
	msg4: .asciiz "Ingrese el cuarto número: "
	msg5: .asciiz "Ingrese el quinto número: "
	array: .space 20

.text
	main:
		li $t0 0
		
		#Ingreso del primer valor
		la $a0 msg1
		li $v0 4
		syscall
		
		li $v0 5
		syscall 
		move array($t0) $v0 
		add $t0 $t0 4 
		
		#Ingreso del segundo valor
		la $a0 msg2
		li $v0 4
		syscall
		
		li $v0 5
		syscall 
		move array($t0) $v0
		add $t0 $t0 4
		
		#Ingreso del tercer valor
		la $a0 msg3
		li $v0 4
		syscall
		
		li $v0 5
		syscall 
		move array($t0) $v0
		add $t0 $t0 4
		
		#Ingreso del cuarto valor
		la $a0 msg4
		li $v0 4
		syscall
		
		li $v0 5
		syscall 
		move array($t0) $v0
		add $t0 $t0 4
		
		#Ingreso del quinto valor
		la $a0 msg5
		li $v0 4
		syscall
		
		li $v0 5
		syscall 
		sw array($t0) $v0
		j impresion
		
	impresion:	
		la $t2 array($t1)
		li $v0 1
		move $a0 $t2
		syscall
		add $t1 $t1 4