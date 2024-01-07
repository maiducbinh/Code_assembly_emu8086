.model small
.stack 100h
.data
    str db 'abbc'
    tb1 db 13, 10, 'Doi xung$'
    tb2 db 13, 10, 'Khong doi xung$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, str
    mov cx, 4
    reverse:
    mov al, [si]
    push ax
    inc si
    loop reverse
    
    lea si, str
    mov cx, 4
    check:   
    pop ax
    cmp al, [si]
    jne Kodoixung
    inc si
    loop check
    
    lea dx, tb1
    jmp inra
    
    kodoixung:
    lea dx, tb2
    
    inra:
    mov ah, 9
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main
    