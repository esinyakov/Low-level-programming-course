EXTRN X: byte
PUBLIC exit 

SD2 segment para public 'DATA'
	Y db 'Y'
SD2 ENDS

SC2 segment para public 'CODE'
	assume CS:SC2, ES:SD2
exit:
	mov ax,SD2
	mov es,ax
	mov ah,[Y]
	mov al,[X]
	mov Y,al
	mov X,ah
	mov dl,Y
	mov ah,2
	int 21h
	mov ax,4c00h
	int 21h
SC2 ends
END