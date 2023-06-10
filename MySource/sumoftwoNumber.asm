.model small
.stack 100h

.data
resultMsg db "Result: $"

.code
main proc
    mov ax, @data
    mov ds, ax      ; Initialize data segment

    mov ax, 500   ; Load the first number into AX
    mov bx, 500   ; Load the second number into BX

    xor dx, dx      ; Clear DX
    MUL bx          ; Multiply AX by BX

  
    MOV BX,AX 
  
  .exit:
    mov ah, 4Ch   
     xor al,al
    int 21h  

    