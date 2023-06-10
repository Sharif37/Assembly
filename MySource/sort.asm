org 100h
.model small
.data
      msg1 db "Enter 10 number : $" 
      msg2 db "The sorted array is : $" 
      array db 10 dup(0)  
arr dw 10 dup(0) 
count dw 0 
track dw 0 
outtrack dw 0   

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




.code
main proc
      lea dx,msg1
      mov ah,9
      int 21h
     
      
      
    xor bx,bx
    mov cx,10  
    mov si, offset array  
    
input: 
 
    mov track,cx
    call read_fun   
    mov [si],bx
    add si,1  
    mov cx,track 
    
loop input 
      
      
      mov cx,10
      dec cx
      outer_loop:
      mov bx,cx
      mov si,0    
      inner_loop:
      mov al,array[si]
      mov dl,array[si+1]   
      cmp al,dl
      jbe no_swap
      mov array[si], dl
      mov array[si+1], al
      no_swap: 
      inc si
      dec bx
      jnz inner_loop
      loop outer_loop
      mov ah,2
      mov dl,10
      int 21h
      mov dl,13
      int 21h
      lea dx,msg2
      mov ah,9
      int 21h
     mov cx ,10
mov bx , offset array
output:
mov dl ,[bx] 
add dl,30h
mov ah ,2
int 21h
mov dl ,32
mov ah , 2
int 21h
inc bx
loop output

      
  .exit
  mov ah, 4ch
  int 21h  
  
  
main endp 


