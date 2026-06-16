                                          .model small
.stack 100h
.data
    tb1 db "Day so gom 20 so do la: $"
    tb2 db 10,13,"Tong cac so chia het cho 7 trong day la: $"
    arr dw 20 dup(?) 
    tmp dw ?
    x dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,tb1
    mov ah,9
    int 21h
    
    lea si,arr
    mov cx,20
input:
    call nhap
    mov [si],AX 
    add si,2
    loop input 
    
    call xu_ly
    lea dx,tb2
    mov ah,9
    int 21h
    
    call inra
    mov ah,4ch
    int 21h
main endp

nhap proc  
    mov x,0
lap:
    mov ah,1
    int 21h
    
    cmp al,32
    je xong
    
    sub al,'0'
    mov ah,0
    
    mov tmp,ax
    mov ax,x
    
    mov bx,10
    mul bx
    add ax,tmp
    mov x,ax 

    jmp lap
xong:
    mov ax,x
    
    ret
nhap endp

xu_ly proc
    lea si,arr
    mov cx,20
    mov x,0
lap1:
    mov ax,[si] 
    mov dx,0
    mov bx,7
    div bx
    cmp dx,0
    jne skip
    
    mov ax,[si]
    add x,ax
skip:
    add si,2
    loop lap1
    ret
xu_ly endp

inra proc
    mov ax,x
    mov cx,0
    mov bx,10
lap2:
    mov dx,0
    div bx
    push dx
    inc cx
    
    cmp ax,0
    jne lap2
lap3:
    pop dx   
    add dl,'0'
    mov ah,2
    int 21h
    loop lap3
    
    ret
inra endp
end main
