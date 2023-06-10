 .MODEL SMALL
.STACK 100H
.DATA
ANS DW ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX   
    
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    
    MOV AH, 0
    
    MOV BX, AX        
    TOP:
    DEC BX
    MUL BX
    CMP BX, 1
    JNE TOP
    
    MOV ANS, AX
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN

