.data   #.data crea una sección de codigo - Data Section 
	msg1: .asciiz "\nIngrese un numero: "   
	msg2: .asciiz "\n\n"
    msg3: .asciiz " "
    msg4: .asciiz "\n\nNumeros ordenados:\n"


.text   # Code Section
	main: 
        # Se reservan 10 bytes en el stack 
        addi $sp $sp -20 

        # t0 numero que se guardará  
        addi $t1 $sp 0 # inicio en el stack
        addi $t2 $t1 20 # fin del stack 
        
    # SOLICITA LOS NUMEROS Y LOS GUARDA 
    ciclo: 
        beq $t1 $t2 ordenar  

        # Pide un numero 
		li $v0 4 
		la $a0 msg1 
		syscall

        # Guarda numero en $t0 
		li $v0 5
		syscall
		move $t0 $v0

        # SE GUARDA EL NUMERO 
        sw $t0 0($t1)
        
        # SE SUMA 4 PARA EL SIGUIENTE NUMERO 
        addi $t1 $t1 4 

        j ciclo


    # EN LA SIGUIENTE ETIQUETA SE ORDENAN LOS NUMEROS  
            # t0 - t3 direcciones
            # t4 - t7 valores 
    ordenar: 
        # Se setean las condiciones para el ciclo
        addi $t0 $sp 4 # inicio en el stack
        addi $t1 $sp 20 # fin del stack

        ciclo2:
            beq $t0 $t1 imprimir 

            # Se imprime el numero que se pidio 
            lw $t5 0($t0)


            addi $t3 $t0 0 
            addi $t2 $t0 -4 

        ciclo_interno: 
            beq $t3 $sp ciclo2_2
            lw $t4 0($t2)
            bgt $t4 $t5 if_mayor
        
        continue:
            # CORRE LOS PUNTEROS HACIA ATRAS 
            addi $t3 $t3 -4
            addi $t2 $t3 -4

            j ciclo_interno

    ciclo2_2:
        # SE SUMA 4 PARA EL SIGUIENTE NUMERO 
        addi $t0 $t0 4 

        j ciclo2 



    imprimir: 
        # CONDICIONES INCIALES DEL CICLO 
        addi $t1 $sp 0 # inicio en el stack
        addi $t2 $sp 20 # fin del stack

        # IMPRIME "Numeros ordenados: " 
		li $v0 4 
		la $a0 msg4
		syscall


        ciclo3:
            beq $t1 $t2 fin 

            # IMPRIME EL NUMERO  
            lw $t0 0($t1)
            li $v0 1
            move $a0 $t0
            syscall

            # IMPRIME ESPACIO 
            li $v0 4 
            la $a0 msg3
            syscall

            # SE SUMA 4 PARA EL SIGUIENTE NUMERO
            addi $t1 $t1 4 

            j ciclo3 

    fin: 
        jr $ra



    # HACE EL SPLIT DE LOS NUMEROS
    if_mayor:
        sw $t4 0($t3)
        sw $t5 0($t2)

        j continue

