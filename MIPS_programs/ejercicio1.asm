.data 
	msg1: .asciiz "Ingrese el primer número: "
	msg2: .asciiz "Ingrese el segundo número: "
	
.text
	main:
		#Se muestra el mensaje 1
		li $v0 4
		la $a0 msg1
		syscall
		
		#Se pide el dato y se almacena en el registro t0
		li $v0 5
		syscall 
		move $t0 $v0
		
		#Se muestra el mensaje 2
		li $v0 4
		la $a0 msg2
		syscall
		
		#Se pide el dato y se almacena en el registro t1
		li $v0 5
		syscall 
		move $t1 $v0
		
		#Se suman los registros t0 y t1 y el resultado se almacena en el registro t2
		add $t2 $t1 $t0  
		#Se muestra el resultado de la suma, se mueve el valor del registro t2 hacia el registro a0
		li $v0 1
		move $a0 $t2
		syscall
		jr $ra