.model small
.stack 100h
.data 
    endl db 13, 10, '$'

.code 
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    mov bl, al
    
    mov ah, 9
    lea dx, endl
    int 21h
    
    mov ah, 2
    mov dl, bl
    sub dl, 32
    int 21h
    
    mov ah, 4ch
    int 21h
    
MAIN Endp

End main