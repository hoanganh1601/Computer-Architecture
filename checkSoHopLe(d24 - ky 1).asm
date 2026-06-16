.model small
.stack 100h
.data
    tb1 db 13, 10, 'Nhap mot so (60-80)>: $'
    tb2 db 13, 10, 'So khong hop le! Vui long nhap lai.$'

.code 
MAIN Proc
    mov ax, @data
    mov ds, ax
    
Input:
    lea dx, tb1
    mov ah, 9
    int 21h
    
    ; doc chu so dau tien
    mov ah, 1
    int 21h
    sub al, '0'
    mov bl, 10
    mul bl
    mov cx, ax ; tam thoi luu vao cx
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov ah, 0 ; xoa bit ah (bit cao)
    add cx, ax

Check:
    cmp cx, 60
    jl Invalid
    cmp cx, 80
    jg Invalid 
    
    jmp Save

Invalid:
    lea dx, tb2
    mov ah, 9
    int 21h 
    jmp Input
Save:
    mov bx, cx
    mov ah, 4ch
    int 21h 
    
    
MAIN Endp
End main
    