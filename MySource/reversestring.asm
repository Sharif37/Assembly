.MODEL SMALL
.STACK 100H

.DATA
MSG DB 'KAZI OMAR SHARIF$'

.CODE
    MAIN PROC
        
        MOV AX, @DATA
        MOV DS, AX
        
        MOV SI, OFFSET MSG
        MOV CX, 16
        
        LOOP1:
            MOV BX, [SI]
            PUSH BX
            INC SI
            LOOP LOOP1
        
        
        MOV CX, 16
        
        LOOP2:
            POP DX
            MOV AH, 02H
            INT 21H
            LOOP LOOP2
        
        
        MAIN ENDP
    END MAIN
