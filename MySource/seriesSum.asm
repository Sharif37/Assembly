.model small
.stack 100h

.data
Total dw ?          ; Memory location to store the result

.code
main proc
    mov ax, @data
    mov ds, ax      ; Initialize data segment

    mov cx, 10      ; Number of iterations
    mov ax, 0       ; Initialize the sum to 0

sumLoop:
    add ax, cx      ; Add the current value of CX to the sum
         
    loop sumLoop    ; Loop for all iterations

    mov [Total], ax ; Store the sum in the Total memory location

    
    mov ah, 02h     ; DOS function to display a character
    mov dl, 'T'     ; Display 'T'
    int 21h

    mov dl, 'o'     ; Display 'o'
    int 21h

    mov dl, 't'     ; Display 't'
    int 21h

    mov dl, 'a'     ; Display 'a'
    int 21h

    mov dl, 'l'     ; Display 'l'
    int 21h

    mov dl, ':'     ; Display ':'
    int 21h

    mov ax, [Total] ; Load the sum from the Total memory location
    call display16bitDecimal   ; Display the sum as a 16-bit decimal number

    mov ah, 4Ch     ; DOS function to exit the program
    int 21h         ; Call DOS

main endp

display16bitDecimal proc
    push bx
    push ax

    mov bx, 10      ; Base 10 (decimal)
    xor cx, cx      ; Initialize digit counter

digitLoop:
    xor dx, dx      ; Clear DX
    div bx          ; Divide AX by BX, quotient in AX, remainder in DX
    push dx         ; Push the digit to the stack
    inc cx          ; Increment digit counter
    test ax, ax     ; Check if quotient is zero
    jnz digitLoop   ; If not zero, continue loop

displayLoop:
    pop dx          ; Pop digit from the stack
    add dl, '0'     ; Convert remainder to ASCII character
    mov ah, 02h     ; DOS function to display a character
    int 21h         ; Call DOS

    loop displayLoop ; Loop until all digits are displayed

    pop ax
    pop bx
    ret

end main
