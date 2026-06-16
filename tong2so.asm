.model small
.stack 100h
.data
    x dw ?
    tmp dw ? 
    res dw ?  
    endl db 13, 10, '$'
    
.code 
MAIN Proc
    Mov ax, @data
    Mov ds, ax
    
    mov res, 0
    call nhap_so
    add res, ax
    call nhap_so
    add res, ax
    
    lea dx, endl
    mov ah, 9
    int 21h  
    
    
    mov ax, res
    
    call in_so
    
    mov ah, 4ch
    int 21h
MAIN Endp
    
    nhap_so proc
        mov x, 0 
        mov bx, 10
        mov tmp, 0
        lap1:
            mov ah, 1
            int 21h    
            cmp al, 32 ; 32: space
            je xong    
            
            sub al, '0'
            mov ah, 0 
            mov tmp, ax
            
            mov ax, x
            mul bx ; auto lay ax nhan voi bx roi tra ve a
            add ax, tmp
            
            mov x, ax
            jmp lap1
        
        xong: 
            mov ax, x
            ret
    nhap_so endp
    
    in_so proc  
        
        mov bx, 10
        mov cx, 0
        lap2: 
            mov dx, 0
            div bx 
            push dx
            inc cx
            
            cmp ax, 0
            jnz lap2
            
        xong2:
            pop dx
            add dl, '0'
            mov ah, 2
            int 21h   
            loop xong2
        
        ret
    in_so endp
    
End main    