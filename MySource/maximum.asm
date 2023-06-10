.model small
.stack 100h

.data
Array dw 2,4,9,14,12,7,18,23,22,1
result dw ?

.code
main proc
    mov ax, @data
    mov ds, ax

    mov cx, 10
    mov si, offset Array
    mov ax, 0

    loopArray:
    mov bx, [si]
    cmp bx, ax
    jle next
    mov ax, bx

    next:
    add si, 2
    loop loopArray

    mov result, ax

    ; Display the result
    mov ah, 02h
    mov dl, ' '
    int 21h

    mov ax, result
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
