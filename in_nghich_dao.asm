.model small
.stack 100h
.data
    endl db 13, 10, '$'

.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 0
    
    lap:
        mov ah, 1
        int 21h
        
        cmp al, '#'
        je in_cach
        
        inc cx
        push ax
        
        jmp lap
    in_cach:
        mov ah, 9
        lea dx, endl
        int 21h
    in_full:
        pop dx
        mov ah, 2
        int 21h
        
        loop in_full
    
    mov ah, 4ch
    int 21h
MAIN Endp

End main