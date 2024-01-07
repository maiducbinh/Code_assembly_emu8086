;Tinh giai thua so co 1 chu so: factorial
.model small
.stack 100h
.data
    tb db 13, 10, 'Ket qua: $'
.code    
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 1
    int 21h  
    sub al, '0'
    mov cl, al
    
    mov ax, 1
    mov bl, 1
    
    giaiThua:
    mul bl
    inc bl
    cmp bl, cl
    jle giaiThua
    
    mov cx, ax
    mov ah, 9
    lea dx, tb
    int 21h
    
    mov bl, 10
    mov ax, cx
    mov cx, 0
    chuSo:   
    inc cx
    mov ah, 0   
    div bl
    push ax
    cmp al, 0
    je InRa
    jmp chuSo
    
    InRa:  
    pop ax
    mov dl, ah
    add dl, '0'
    mov ah, 2
    int 21h
    loop InRa
    
    mov ah, 4ch
    int 21h
main endp
end main   

.model small
.stack 100h
.data
    so db 8
    tb db 13, 10, 'Ket qua: $'
.code    
main proc
    mov ax, @data
    mov ds, ax

    mov dx, 0
    mov ax, 1
    mov ch, 0
    mov cl, so
    
    giaiThua:
    mul cx
    loop giaiThua
    
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
    cmp al, 0
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
    
     
    



