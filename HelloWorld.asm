.model small
.stack 100h
.data 
    xau db 'Hello World$'    
    HoangAnh db 'HoangAnh$'

.code 
MAIN Proc
    mov ax, @data
    mov ds, ax
    
    lea dx, xau
    mov ah, 9
    int 21h
    
    mov ah, 4ch
    int 21h
MAIN Endp

End main