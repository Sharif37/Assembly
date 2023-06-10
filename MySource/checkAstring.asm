.MODEL SMALL
.DATA
      VAR1 DB 100 DUP('$')
      NUM1 DW 7
      MSG1 DB "student$"
      MSG2 DB 10, 13, "THE USERNAME IS VALID$"
      MSG3 DB 10, 13, "INVALID USER NAME$" 
.CODE
MAIN PROC   
      MOV AX,  @DATA
      MOV DS, AX
      
      MOV SI,OFFSET VAR1
      MOV CX, NUM1 
      
      LOOP1:
      MOV AH,1
      INT 21H
      CMP AL,13
      JNE INCREMENT
      
      PROGRAM:
      INC SI
      DEC CX
      JNZ LOOP1
      
      MOV CX,NUM1
      MOV SI,OFFSET VAR1  
      MOV DI,OFFSET MSG1
      
      
      IS_EQUAL:
      MOV BX,[SI]
      CMP BX,[DI]
      JNE INVALID
      INC SI
      INC DI
      DEC CX
      JNZ IS_EQUAL
      MOV DX,OFFSET MSG2
      MOV AH,9
      INT 21H
      MOV AH,4CH
      INT 21H
      
      INVALID:
      MOV DX,OFFSET MSG3
      MOV AH,9
      INT 21H
      MOV AH,4CH
      INT 21H
       
      INCREMENT:
      MOV [SI],AL
      JMP PROGRAM
      
  MAIN ENDP
END MAIN
