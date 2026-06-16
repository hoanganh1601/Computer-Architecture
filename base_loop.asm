.model small
.stack 100h
.data
    endl db 13, 10, '$'
    chaoTa db 'Xin Chao$'

.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 0
    lap:       
        cmp cx, 5
        je break
        
        mov ah, 9
        lea dx, chaoTa
        int 21h
        
        mov ah, 9
        lea dx, endl
        int 21h
        
        inc cx
        jmp lap
        
    break:
    mov ah, 4ch
    int 21h
MAIN Endp

End main