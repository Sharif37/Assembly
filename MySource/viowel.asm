.MODEL SMALL
.STACK 100H
.DATA
A DB 'STRING: $'
C DB 10,13,'TOTAL VOWAL:$'
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV BL,0
    MOV CL,0
    
    MOV AH,1
    INT 21H

WHILE:
    CMP AL,0DH ; 
    JE ENDL
    
    CMP AL,'A'
    JE OK
    CMP AL,'a'
    JE OK
    CMP AL,'E'
    JE OK
    CMP AL,'e'
    JE OK
    CMP AL,'I'
    JE OK
    CMP AL,'i'
    JE OK
    CMP AL,'O'
    JE OK
    CMP AL,'o'
    JE OK
    CMP AL,'U'
    JE OK
    CMP AL,'u'
    JE OK
    
    UP:
    INC BL
    INT 21H
    JMP WHILE      
    
    
OK:
    INC CL
    JMP UP
    
ENDL:    
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,2
    MOV DL,CL
    ADD DL,30H
    INT 21H
    
    ; EXIT PROGRAM
    MOV AH, 0
INT 20H
    
    MAIN ENDP
END MAIN
