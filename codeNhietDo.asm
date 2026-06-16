.model small
.stack 100h
.data 
    cong_nhiet_do equ 125
    cong_dieu_khien equ 127
    
.code
MAIN Proc
    ; Buoc 1 ktao data
    mov ax, @data
    mov ds, ax

    batdau:
        mov dx, cong_nhiet_do
        in al, dx
        
        cmp al, 70
        jge tat
    
    bat:
        mov dx, cong_dieu_khien
        mov al, 1
        out dx, al
        
        jmp batdau
    
    
    tat:
        mov dx, cong_dieu_khien
        mov al, 0
        out dx, al
                  
        jmp batdau
        
MAIN Endp
End main