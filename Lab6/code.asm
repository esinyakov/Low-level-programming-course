.386
.model flat, C
	public p

.stack
.data
.code

p proc
	push ebp
	mov ebp, esp



	mov ecx, [ebp+8]


	mov eax, 1
	call dopf

	mov ecx,[ebp+12]
	mov [ecx], eax


	pop ebp	

ret
p endp

dopf proc near
	cmp ecx, 1
	jle m

	imul eax, ecx
	dec ecx
	call dopf
m:
	ret
dopf endp

end