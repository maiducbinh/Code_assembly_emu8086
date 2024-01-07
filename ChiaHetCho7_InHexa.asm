.model small
.stack 100h
.data 
    arr db 7, 5, 80, 22, 21, 7, 14, 3, 1, 84
    tb  db 'Tong: $'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov cx, 10
    lea si, arr
    mov bl, 7
    mov dx, 0
    
    lap:
    mov al, [si]
    mov ah, 0
    div bl
    cmp ah, 0
    jne NotAdd
    add dl, [si]
    notadd:
    inc si
    loop lap
    
    mov ax, dx
    call printHexa
    
    mov ah, 4ch
    int 21h
main endp

printHexa proc
    mov cx, 0
    mov bl, 16
    
    hexa:
    mov ah, 0
    div bl
    mov dl, ah
    push dx
    inc cx
    cmp al, 0
    jne hexa
    
    inra:
    pop dx
    cmp dl, 10
    je hex_a
    
    cmp dl, 11
    je hex_b
    
    cmp dl, 12
    je hex_c
    
    cmp dl, 13
    je hex_d
    
    cmp dl, 14
    je hex_e
    
    cmp dl, 15
    je hex_f
    
    add dl, '0'
    jmp print
    
    hex_a:
    mov dl, 'A'
    jmp print
    
    hex_b:
    mov dl, 'B'
    jmp print
    
    hex_c:
    mov dl, 'C'
    jmp print
    
    hex_d:
    mov dl, 'D'
    jmp print
    
    hex_e:
    mov dl, 'E'
    jmp print
    
    hex_f:
    mov dl, 'F'
    
    print:
    mov ah, 2
    int 21h
    loop inra
    
    ret
printhexa endp
end main