.model small
.stack 100h

.data
    cong_led equ 199
 
.code
MAIN Proc
    ; Buoc 1: ktao data
    mov ax, @data
    mov ds, ax
    
    batdau:
        mov al, 00h ; 8 bit full 0 : dang bat
        mov dx, cong_led
        
        out dx, al ; xuat al vao dx
        mov cx, 250
    
    tre1:
        nop  ; lat lai la 1
        loop tre1
        
    
    not al ; dao al lai 
    out dx, al
    mov cx, 250
    
    tre2: 
        nop
        loop tre2
   
    jmp batdau
    
    mov ah, 4ch
    int 21h
MAIN Endp

End main
        
        