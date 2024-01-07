;dao nguoc chuoi
.model small
.stack 100
.data 
    str db 50 dup('$')
    tb  db 13, 10, 'Chuoi da nhap la: $'

.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 10
    lea dx, str
    int 21h
    
    lea dx, tb
    mov ah, 9
    int 21h
    
    mov cl, [str + 1] ;luu do dai chuoi
    lea si, [str + 2] ;lay vi tri tu thu 2
    
    lap:
        push [si]
        inc si
        loop lap
        
    mov cl, [str + 1]
        
    lap2:
        pop dx
        mov ah, 2
        int 21h
        loop lap2
    
    mov ah, 4ch
    int 21h
main endp
end main