.model small
.stack 100h

.data
answer dw 0
string db "exercise$"

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 0
    mov SI, offset string

    check: 
    mov al, [SI]
    cmp al, '$'
    je finish

    cmp al, 'e'
    jne not_e
    inc answer

    not_e:
    inc SI
    jmp check

    finish: 
    mov Ax, answer  
    
    call printNumber

    mov ah, 4Ch
    int 21h

printNumber proc
    push ax
    push bx
    push cx
    push dx

    mov cx, 0
    mov bx, 10

    nextDigit:
    xor dx, dx
    div bx
    push dx
    inc cx
    test ax, ax
    jnz nextDigit

    printLoop:
    pop dx
    add dl, 30h
    mov ah, 02h
    int 21h
    loop printLoop

    pop dx
    pop cx
    pop bx
    pop ax
    ret

end main
