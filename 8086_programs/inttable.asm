ORG 1000H
MSJ DB  "INGRESE UN NUMERO:"
FIN DB ?

ORG 1500H
NUM DB ?
CRONO DW 5
ip_reloj DW 0
cs_reloj DW 0
IRQ0 EQU 28d
IRQ01 EQU 30d




ORG 2000H
mov bx,IRQ0
mov ax,[bx]
mov ip_reloj,ax
add bx,IRQ01
mov ax,[bx]
mov cs_reloj,ax

cli
mov ax,OFFSET TIMERPRC
mov bx,IRQ0
mov [bx],ax
mov ax,2000
mov bx,IRQ01
mov [bx],ax
sti

MOV BX, OFFSET MSJ
MOV AL, OFFSET FIN-OFFSET MSJ
INT 7

MOV BX, OFFSET NUM
INT 6
HLT

TIMERPRC: inc CRONO
iret
END

