.model small
.stack 100h
.data
    so db ?
    tb db 13, 10, 'factorial: $'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h 
    sub al, '0'
    mov so, al
    
    mov ax, 1
    mov dx, 0        
    mov ch, 0
    mov cl, so
    giaithua:
    mul cx
    loop giaithua
    
    call printDigit
    
    mov ah, 4ch
    int 21h
main endp

printDigit proc
    mov bx, 10
    mov cx, 0
    digit:
    mov dx, 0
    div bx
    push dx  
    inc cx
    cmp ax, 0
    jne digit
    
    inra:
    pop dx
    add dl, '0'
    mov ah, 2
    int 21h 
    loop inra
    
    ret
printDigit endp
end main