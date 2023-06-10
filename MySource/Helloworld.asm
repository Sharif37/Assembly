
.MODEL SMALL
.STACK 100H



.DATA
  
Hello DB "Computer Science and Engineering",0 
Newline DB 0Ah, 0Dh, "$"   



.CODE
.STARTUP



      
      LEA DX,Hello  ; print string 
      MOV AH, 9H
      INT 21H
       
       
     
     
         
   
    
    
  .exit:
    mov ah, 4Ch   
     xor al,al
    int 21h  

    
    
    
  
   







