

     SSTACK     SEGMENT PARA STACK  'STACK'
                DB   64 DUP('EEEE____')
     SSTACK     ENDS

     DSEG          SEGMENT  PARA PUBLIC 'DATA'
     X         DB      1,2,3,4,1,2,3,4,1,2,3,4,1,2,3,4
     N         DB      4
     DSEG          ENDS


PAGE
     CSEG      SEGMENT PARA PUBLIC 'CODE'
               ASSUME CS:CSEG,DS:DSEG,SS:SSTACK

     START     PROC FAR
               MOV  AX,DSEG				
               MOV  DS,AX

     M1:       MOV   AL,3               
										
               MOV   BX, OFFSET X		
										

               MOV   CL, N				
			   DEC CL					
										

     M2:       PUSH CX                  
										

               MOV CL, AL				
										

               MOV DI, 3				
               MOV SI, 1				

     M3:                                

			   PUSH DI					
			   ADD DI, SI				
										

               MOV DL, [BX][SI]			
               XCHG DL, [BX][DI]		
               MOV [BX][SI], DL			
               
			   POP DI					

               ADD DI, 3                                      
               INC SI					
               LOOP M3                  

                    
               DEC AL					
               ADD BX, 5                
               POP CX					
               LOOP M2                 


 
     M6:       MOV  AH,4CH
               MOV  AL,0
               INT 21H
     START     ENDP

     CSEG      ENDS
               END  START