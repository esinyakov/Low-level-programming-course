PUBLIC X
EXTRN exit: far
STK segment STACK 'STACK'

	db 100 dup('*')
STK ENDS

SD1 segment para public 'DATA'
	X db 'X'
SD1 ENDS

SC1 segment para public 'CODE'
	assume DS:SD1, CS:SC1
main:
	mov ax,SD1
	mov ds,ax

	jmp exit

SC1 ENDS
END main