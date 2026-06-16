.model small
.stack 100h
.data
    cong_led equ 199

.code
MAIN Proc
    mov ax, @data
    mov ds, ax
    mov al, 11011111b
    
    batdau:
        mov dx, cong_led
        out dx, al
        
        mov cx, 350
    tre1:
        nop
        loop tre1
    
    
    ror al, 1
    jmp batdau
    
    mov ah, 4ch
    int 21h

MAIN Endp
End main
