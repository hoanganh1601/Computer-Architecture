.model small
.stack 100h

.data
    tiengviet db 13, 10, 'HoangAnh', '$'
    tienganh db 'Hello', '$'
    endl db 13, 10, '$'  
    str db 100, 0, 100 dup('$') 
    
    
.code 
main proc 
    mov ax, @data
    mov ds, ax 
    
    mov ah, 1
    int 21 h
    
    mov bl, al
    
    lea dx, endl
    mov ah, 9
    int 21h
    
    mov dl, bl
    mov ah, 2    
    int 21h
    
    
    
main endp

end main