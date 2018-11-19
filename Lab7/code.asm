; | Overflow  | OV |
; | Direction | UP |
; | Interrupt | EI |
; | Sign      | PL |
; | Zero      | ZR |
; | Auxiliary | AC |
; | Parity    | PE |
; | Carry     | CY |

.386
.MODEL FLAT, C
	public function
.STACK
.DATA
	SELECTED DD 2
	OPTIONS DD proc0, proc1, proc2, proc3, proc4, proc5, proc6, proc7, proc8
	X DW 0000fh
	ARR DB 17 DUP ('+')

	HEXNUMS DB '0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F' 
.CODE
	function PROC	
		;// EBX - array adress
		mov ebx, offset arr


		mov eax, SELECTED
		CALL OPTIONS[eax*4]

		ret
	function ENDP
	



	;// Output menu (not necessary)
	proc0 PROC
		ret
	proc0 ENDP
	
	;// Input number (not necessary - defined as X)
	proc1 PROC
		ret
	proc1 ENDP
	
	;// display (in an array of characters in memory) X in the form of a binary unsigned integer

	proc2 PROC
		mov bx, x 
		mov ecx, 16 
		mov esi,0 
		
		jmp output
		counter_decrement:
			dec ecx
		output:
			shl bx, 1
			setc al 
			
			cmp al, 0
			jz check_if_preceding_zero
			jmp actual_output
			
			check_if_preceding_zero:
				cmp si, 0
				jz counter_decrement
				
			actual_output:
				add al,'0'
				mov ARR[si+1],al 
				inc si
		loop output

		proc2_exit:

		ret
	proc2 ENDP

	;// display (in an array of characters in memory) X in the form of a binary signed integer
	;// without leading zeros

	proc3 PROC
		
		bt X,15 
		setc al 
		cmp al, 0 
		jz proc3_output 
		neg x 
		mov arr[0], '-'
		proc3_output:
		call proc2


		ret
	proc3 ENDP

	;// display (in an array of characters in memory) X in the form of a decimal unsigned integer


	proc4 PROC
		
		mov eax, 0
		mov ebx, 0
		mov edx, 0
		mov ecx, 0
		


		mov ebx, 10	
		mov ax, x 
		proc4_snap_number:
			mov edx, 0
			div bx
			add edx, '0'
			inc cx
			push edx
			cmp eax, 0 
			jne proc4_snap_number 

		mov ebx, 1
		proc4_output:
			pop eax
			mov arr[ebx], al
			inc ebx
			loop proc4_output
		

		ret
	proc4 ENDP

	;// display (in an array of characters in memory) X in the form of a decimal signed integer
	;// without leading zeros

	proc5 PROC
		
		bt X,15
		setc al
		cmp al, 0
		jz proc5_output
		neg x
		mov arr[0], '-'
		proc5_output:
		call proc4
		ret
	proc5 ENDP

	;// display (in an array of characters in memory) X in the form of a hexadecimal unsigned integer

	proc6 PROC
		
		mov eax, 0
		mov ebx, 0
		mov edx, 0
		mov ecx, 0
		


		mov ebx, 16	
		mov ax, x 
		proc6_snap_number:
			mov edx, 0
			div bx
			inc cx
			push edx
			cmp eax, 0
			jne proc6_snap_number

		mov ebx, 1
		proc6_output:
			pop eax
			mov dl, hexnums[eax]
			mov arr[ebx], dl
			inc ebx
			loop proc6_output
		
		ret
	proc6 ENDP

	;// display (in an array of characters in memory) X in the form of a hexadecimal signed integer
	;// without leading zeros

	proc7 PROC
		
		bt X,15
		setc al
		cmp al, 0
		jz proc7_output
		neg x
		mov arr[0], '-'
		proc7_output:
		call proc6
		ret
	proc7 ENDP

	
	proc8 PROC
		ret
	proc8 ENDP

END
