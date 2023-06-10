.model small
.stack 100h
  
  
  
.data   

max dw ?    
arr dw 10 dup(0) 
count dw 0 
track dw 0   
p db 'maximum:$' 

.code

main proc       
    
    mov ax, @data
    mov ds, ax  
    
      
    xor bx,bx
    mov cx,10  
    mov si, offset arr   
    
input: 
 
    mov track,cx
    call read_fun   
    mov [si],bx
    add si,2  
    mov cx,track 
    
loop input 
    
    
    
   
    mov ax, 0
    mov cx, 10 
    mov si,offset arr
    
loopArray: 

    mov bx, [si]    
    cmp bx,ax  ; cmp destination, source
    jle update_max
    mov ax, bx  
    
    
    update_max:
    add si, 2
loop loopArray    


   
   mov bx,0 
   mov bx, ax 
   mov max,bx  
  
      
      
   mov ah,2
   mov dl,10
   int 21h
   mov dl,13
   int 21h 
   
   
   mov ah,9
   LEA dx,p
   int 21h    
        
 call write_fun 
   
  
    
    
  .exit
  mov ah, 4ch
  int 21h
  
    
    
    

main endp

    
    
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
