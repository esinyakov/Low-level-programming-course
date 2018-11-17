.386
.model FLAT,C
PUBLIC STRCOPYASM

.CODE
;extern "C" void STRCOPYASM(char* p1, char* p2, int len);
STRCOPYASM PROC
	PUSH EBP
	MOV EBP,ESP
	PUSH ESI
	PUSH EDI

	PUSHF
	

	MOV ECX, [EBP + 16]
	MOV EDI, [EBP + 12]	; source P2
	MOV ESI, [EBP + 8]  ; reciever P1



	CLD ; DF := 0;

	CMP EDI, ESI ; P2,P1
	JE GOOUT ; P2 == P1
	JB NOREV ; P2 < P1
	
	;P2 > P1

	MOV EAX,EDI
	SUB EAX,ESI
	CMP ECX,EAX
	JB NOREV 

	STD ; DF := 1
	ADD EDI, ECX
	DEC EDI
	ADD ESI, ECX 
	DEC ESI

	NOREV:
	REP MOVSB
	

	GOOUT:

	POPF
	POP EDI
	POP ESI
	POP EBP
	RET
STRCOPYASM ENDP
END