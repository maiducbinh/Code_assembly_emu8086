;Tong cac chu so
;co the xay ra truong hop tong chu so > 10

.model small
.stack 100
.data
    so  db 5 dup('$')
    tb  db 13, 10, 'Tong chu so: $'
    deci db 10     
    tong db 0
.code 
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 10
    lea dx, so
    int 21h
    
    mov ch, 0
    mov cl, [so + 1]
    lea si, so + 2
        
    mov ax, 0
    
    tinhTong:  
    mov bx, 0
    mov bl, [si]
    sub bl, '0'
    add ax, bx
    inc si
    loop tinhTong  
    
    mov cx, 0
    
    Digit:
    mov ah, 0      
    div deci  
    inc cx
    push ax
    cmp al, 0
    je Thoat
    jmp Digit 
    
    Thoat:
    lea dx,tb
    mov ah, 9
    int 21h
             
    xor bx, bx
    InRa:
    pop bx
    mov dl, bh
    add dl, '0'
    mov ah, 2
    int 21h  
    loop InRa
    
    mov ah, 4ch
    int 21h
main endp
end main
    
    
    