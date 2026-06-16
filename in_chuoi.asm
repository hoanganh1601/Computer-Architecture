.model small
.stack 100h
.data
    str db 100, 0, 100 dup('$')
    endl db 13, 10, '$'

.code 
MAIN Proc
    mov ax, @data
    mov ds, ax
        
    ; doc chuoi    
    mov ah, 10
    lea dx, str
    int 21h
    mov bl, al
    
    mov ah, 9
    lea dx, endl
    int 21h
    
    mov ah, 9
    mov dl, bl
    lea dx, str + 2
    int 21h
    
    mov ah, 4ch
    int 21h
MAIN Endp

End main