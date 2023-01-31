.data
	msg1: .asciiz "1. Ingresar un punto \n"
	msg2: .asciiz "2. Listar los puntos ingresados\n"
	msg3: .asciiz "3. Salir\n"
	msg4: .asciiz "Seleccione una opcion: "
	msg5: .asciiz "\nIngrese la coordenada X: "
	msg6: .asciiz "\nIngrese la coordenada Y: "
	msg7: .asciiz "\nIngrese la coordenada Z: "
	msg8: .asciiz "\nYa se ha llegado al número máximo de ingresos al struct"
	msg9: .asciiz "\n"
	msg10: .asciiz " , "
	msg11: .asciiz "x, y, z\n"

.text
	main:
		#Se reserva el espacio indicado por el struct
		addi $sp $sp -120
		
		#t1 se iniciara junto a el valor de sp para poder ser el que se mueva
		addi $t1 $sp 0
	
	inicio:
		#Se muestra el mensaje del menú
		li $v0 4
		la $a0 msg1
		syscall
		li $v0 4
		la $a0 msg2
		syscall
		li $v0 4
		la $a0 msg3
		syscall
		li $v0 4
		la $a0 msg4
		syscall
		
		#Se ingresa la opcion deseado y se coloca en el registro t0
		#t0 será utilizado para instrucciones
		li $v0 5
		syscall
		move $t0 $v0
		
		beq $t0 1 ingresarPunto
		beq $t0 2 mostrarPuntos
		beq $t0 3 fin
		
	ingresarPunto:
		#Se usara $t3 para leer los valores ingresados
		bge $t2 10 mensaje
		
		li $v0 4
		la $a0 msg5
		syscall
		
		li $v0 5
		syscall
		move $t3 $v0
		sw $t3 0($t1)
		addi $t1 $t1 4
		
		li $v0 4
		la $a0 msg6
		syscall
		
		li $v0 5
		syscall
		move $t3 $v0
		sw $t3 0($t1)
		addi $t1 $t1 4
		
		li $v0 4
		la $a0 msg7
		syscall
		
		li $v0 5
		syscall
		move $t3 $v0
		sw $t3 0($t1)
		addi $t1 $t1 4
		
		li $v0 4
		la $a0 msg9
		syscall
		
		addi $t2 $t2 1
		j inicio
	
	mostrarPuntos:
		#Se usara $t4 para contar las iteraciones
		li $t4 0
		addi $t5 $sp 0
		
		li $v0 4
		la $a0 msg11
		syscall
		
		j ciclo
		
	ciclo:
		
		lw $t7 0($t5)
		li $v0 1
		move $a0 $t7
		syscall
		addi $t5 $t5 4
		
		li $v0 4
		la $a0 msg10
		syscall
		
		lw $t7 0($t5)
		li $v0 1
		move $a0 $t7
		syscall
		addi $t5 $t5 4
		
		li $v0 4
		la $a0 msg10
		syscall
		
		lw $t7 0($t5)
		li $v0 1
		move $a0 $t7
		syscall
		addi $t5 $t5 4
		
		li $v0 4
		la $a0 msg9
		syscall
		
		addi $t4 $t4 1
		bge $t4 $t2 inicio
		j ciclo
	
	mensaje:
		li $v0 4
		la $a0 msg8
		syscall
		
		j inicio
	
	fin:
		jr $ra