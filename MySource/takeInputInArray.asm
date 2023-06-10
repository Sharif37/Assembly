.model small
.stack 100h

.data
num1 dw ?
num2 dw ? 
result dw ? 
 count dw 0
p db 'result:$'   


.code  

  read_fun proc near  
    
   xor bx,bx
   xor cx,cx
   
   READ: 
   cmp cx,2
   JE END_READ  
   
   mov ah,01h
   int 21h
   JE READ
   
   
    cmp AL,10h 
    JE READ
    
    cmp AL,13h
    JE END_READ
    inc cx
    sub al,48 
    
    
    mov ah,00h
    push ax
    mov ax,bx
    mov bx,10
    mul bx
    mov bx,ax
    pop ax
    add bx,ax
    jmp READ
    
    END_READ:
   
    mov ah,2
    mov dl,32 
    int 21h
   
    
     ret
     
     read_fun endp 



write_fun proc near
     
     mov ax,bx
     mov dx,0 
       
     
     write:
    
     mov bx,10
     DIV bx 
     mov cx,ax
     
     add dl,30h 
      mov dh,0  
     push dx
    add count,1
     
     
     mov ax,cx
     mov dx,0
     
     test ax,ax
     jnz write  
          
      mov cx,count
      mov ah,2
      print:
      pop dx
      int 21h
      loop print
     
     ret
 write_fun ENDP 
     






main proc
   mov ax, @data
   mov ds, ax

   
   call read_fun  
   
   mov num1,bx
   xor bx,bx
   call read_fun 
   mov num2,bx
   
   xor bx,bx
   
   
   xor ax,ax
   mov ax,num1
   mul num2
   
   mov result ,ax
   mov bx,ax 
   
   mov ah,9
   LEA dx,p
   int 21h
   
   call write_fun 


   mov ah, 4Ch
   int 21h
main endp

end main
