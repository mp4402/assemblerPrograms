ORG 1000H
MSJ DB "Empieza el programa"
FIN DB ?

ORG 1500H
MSJ3 DB "Se llamo al INT 7: "
CRONO DW 0
FIN3 DB ?
ip_reloj DW 0
cs_reloj DW 0
IRQ0 EQU 28d
IRQ01 EQU 30d

ORG 161AH
MSJ2 DB "Carlos y Mario"
FIN2 DB ?

ORG 2000H 
MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7


mov bx,IRQ0
mov ax,[bx]
mov ip_reloj,ax
add bx,IRQ01
mov ax,[bx]
mov cs_reloj,ax

cli
mov ax,OFFSET CYCLE
mov bx,IRQ0
mov [bx],ax
mov ax,2000
mov bx,IRQ01
mov [bx],ax
sti

MOV BX, OFFSET MSJ2
MOV AL, OFFSET FIN2-OFFSET MSJ2
INT 7

INT 7

MOV BX, OFFSET MSJ2
MOV AL, OFFSET FIN2-OFFSET MSJ2
INT 7



cli
mov bx,IRQ0
mov ax, ip_reloj
mov [bx], ax
mov bx, IRQ01
mov ax, cs_reloj
mov [bx], ax
sti

MOV BX, OFFSET MSJ3
MOV AL, OFFSET FIN3-OFFSET MSJ3
INT 7


HLT


CYCLE: inc CRONO

push ax
push bx
push cx
push dx



cli
mov bx,IRQ0
mov ax, ip_reloj
mov [bx], ax
mov bx, IRQ01
mov ax, cs_reloj
mov [bx], ax
sti

MOV BX, OFFSET MSJ2
MOV AL, OFFSET FIN2-OFFSET MSJ2
INT 7

mov bx,IRQ0
mov ax,[bx]
mov ip_reloj,ax
add bx,IRQ01
mov ax,[bx]
mov cs_reloj,ax

cli
mov ax,OFFSET CYCLE
mov bx,IRQ0
mov [bx],ax
mov ax,2000
mov bx,IRQ01
mov [bx],ax
sti

pop dx
pop cx
pop bx
pop ax


iret

END

