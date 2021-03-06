

     SSTACK     SEGMENT PARA STACK  'STACK'
                DB   64 DUP('EEEE____')
     SSTACK     ENDS

     DSEG          SEGMENT  PARA PUBLIC 'DATA'
     CA        DB      'A'
     KA        DB      '65'
     TXT       DB      'symbol "'
     C$        DB      ?
               DB      '" code '
    KCH1       DB      ?
    KCH2       DB      ?
               DB      10,13,'$'
    MSG0       DB      'start',13,10,'$'
    MSG1       DB      'end',13,10,'$'
     DSEG          ENDS

PAGE
     CSEG      SEGMENT PARA PUBLIC 'CODE'
               ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

     BEGIN     PROC FAR

               PUSH  DS 
               MOV  AX,0
               PUSH  AX

     M1:       MOV  AX,DSEG
               MOV  DS,AX

     M2:       MOV  AH,9
               MOV  DX,OFFSET MSG0
               INT  21H

     MA:       MOV  AL,CA
               MOV  C$,AL
                  MOV  AX,WORD PTR KA
                  MOV  WORD PTR KCH1,AX
               MOV  AH,9
               MOV DX,OFFSET TXT
               INT  21H

     MB:       INC  C$
               INC  KCH1+1
               INT  21H

     MC:       INC  C$
               INC  KCH1+1
               INT  21H


     M3:       MOV  AH,9
               MOV  DX,OFFSET MSG1
               INT  21H


               RET
     BEGIN     ENDP

     CSEG      ENDS
               END  BEGIN