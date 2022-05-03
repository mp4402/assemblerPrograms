#El . simbloiza un bloque de código
.data #Seccion de datos
	holamundo: .asciiz "Hola Mundo" 
	
.text #Code Section  
	main:
		li $v0 4#Se asigna 4 en el registro v0
		la $a0 holamundo #Se asigna la direccion de holamundo a a0
		syscall
		
		jr $ra