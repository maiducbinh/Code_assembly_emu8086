;10. (asembly)  Chuyen he 10 dang he 2
.model small
.stack 100
.data
    tb  db 13, 10, 'So da nhap dang nhi phan la: $'
    str db 5 dup('$') 
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ax, '#'
    push ax
    
    lea dx, str
    mov ah, 10
    int 21h                   
    
    mov ax, 0
    mov bx, 10       
    mov cl, [str + 1]
    lea si, str + 2
    
    
    thapPhan: ;chuyen xau thanh so
    mul bx   
    mov dx, [si]
    sub dx, '0'
    add ax, dx
    inc si
    loop thapPhan   
    
    mov bl, 2
    
    nhiPhan:  
    mov ah, 0
    div bl   ;bl not bx
    push ax
    cmp al, 0
    jne nhiPhan  
          
          
    mov ah, 9
    lea dx, tb
    int 21h 
    
    mov ah, 2
    InRa:
    pop dx   
    cmp dx, '#'
    je Thoat
    mov dl, dh
    add dl, '0'
    int 21h
    jmp InRa 
    
    Thoat:
    mov ah, 4ch
    int 21h
main endp
end main
    
    
    
