.model small
.stack 100h
.data
    so1 db ?
    so2 db ?
    tb1 db 13, 10, 'UCLN: $'
    tb2 db 13, 10, 'BCNN: $'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov so1, al
    
    mov ah, 1
    int 21h
    sub al, '0'
    mov so2, al
    
    mov cl, so1
    mov ch, so2
    gcd:
    cmp cl, ch
    je thoat
    jg greater
    sub ch, cl
    jmp gcd
    greater:
    sub cl, ch
    jmp gcd
     
    thoat: 
    mov al, cl
    call printDigit 
    
    mov al, so1
    mul so2
    div cl
    call printDigit
    
    mov ah, 4ch
    int 21h
main endp

printDigit proc 
    push cx
    mov bl, 10
    mov cx, 0
    
    digit:
    mov ah, 0
    div bl
    mov dl, ah
    push dx
    inc cx
    cmp al, 0
    jne digit
    
    inra:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h
    loop inra
    pop cx
    ret
printDigit endp
end main
    
    
    