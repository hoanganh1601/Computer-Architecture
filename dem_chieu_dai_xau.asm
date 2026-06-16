.model small
.stack 100h
.data                   
    endl db 13, 10, '$'
    str db 100, 0, 100 dup('$')

.code 
MAIN Proc
    mov ax, @data
    mov ds, ax
               
    lea dx, str
    mov ah, 10
    int 21h
    
    ; get the actual length
    mov ax, 0
    mov al, str + 1 ; length
    mov cx, 0
    mov bx, 10; dividion
    
    lap:   
        mov dx, 0
        div bx
        push dx ; du
        inc cx
        
        cmp ax, 0  ; thuong
        jnz lap
    
    in_cach:
        mov ah, 9
        lea dx, endl
        int 21h
    
    in_full:
        pop dx
        add dl, '0'
        mov ah, 2
        int 21h
        
        loop in_full
    
    mov ah, 4ch
    int 21h
MAIN Endp

End main
       
      
  
    
    