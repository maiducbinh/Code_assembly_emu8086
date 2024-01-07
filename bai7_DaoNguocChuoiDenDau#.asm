;dao nguoc chuoi den dau #
.model small
.stack 100h
.data
    str db 50 dup('$')
    tb  db 13, 10, 'Chuoi dao nguoc la: $'
    
.code 
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 0 
    start:   
    mov ah, 1
    int 21h
    cmp al, '#'
    je thoat
    push ax  
    inc cx
    jmp start
    
    thoat:
    lea dx, tb
    mov ah, 9
    int 21h
    
    inChuoi:
    mov ah, 2
    mov dl, 0 ;in dau cach
    int 21h  
                   
    pop dx
    mov ah, 2
    int 21h
    
    loop inChuoi
                          
    mov ah, 4ch
    int 21h
main endp
end main