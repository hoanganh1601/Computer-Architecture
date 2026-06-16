.model small
.stack 100h
.data
    endl db 13, 10, '$'
    str db 100, 0, 100 dup('$')
    
.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 10
    lea dx, str
    int 21h
    
    mov ah, 9
    lea dx, endl
    int 21h
    
    lea si, str + 2
    lap:
        cmp [si], 13
        je break
        
        cmp [si], 'a'
        jl continue
        
        cmp [si], 'z'
        jg continue
        
        sub [si], 32
        
    continue:
        mov ah, 2
        mov dl, [si]
        int 21h
        inc si
        jmp lap
    break:
        mov ah, 4ch
        int 21h
MAIN Endp
End main