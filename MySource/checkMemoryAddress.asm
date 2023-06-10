.model small
.stack 100h

.data
myData dw 1234h  ; 16-bit data value

.code
main proc
   mov ax, @data
   mov ds, ax

   mov ax, 0   ; Clear AX register

   ; Load segment value into a segment register (e.g., DS)
   mov ax, seg myData
   mov ds, ax

   ; Load offset value into a general-purpose register (e.g., BX)
   mov bx, offset myData

   ; Combine segment and offset to form the physical address
   shl ax, 4     ; Shift the segment value left by 4 bits (multiply by 16)
   add ax, bx    ; Add the offset value to the shifted segment value

   ; The resulting AX register contains the 20-bit physical address
   ; Use the address for read or write operations

   mov ah, 4Ch
   int 21h
main endp

end main
