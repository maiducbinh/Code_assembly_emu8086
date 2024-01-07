;Chuyen thap phan sang hexa
.model small
.stack 100h
.data
    tb  db 13, 10, 'Chuoi dang hexa la: $'
    str db 5 dup("$")
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 10
    lea dx, str
    int 21h           
          
    mov ch, 0
    mov cl, [str + 1]
    lea si, str + 2
    mov bx, 10
    mov ax, 0
    
    thapPhan:
    mul bl
    mov dx, [si]
    sub dx, '0'
    add ax, dx
    inc si
    loop thapPhan   
    
    mov bx, ax
    mov ah, 9
    lea dx, tb
    int 21h
              
    mov ax, bx
    call printHexa    
    
    mov ah, 4ch   
    int 21h
main endp

printHexa proc
    mov bx, 16
    mov cx, 0
    
    hexa:     
    mov ah, 0
    div bl
    push ax
    inc cx
    cmp al, 0
    je ketQua
    jmp hexa         
    
    
    ketQua:
    pop ax
    mov dl, ah
    
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
    jmp InRa
               
    hex_a:
    mov dl, 'A'
    jmp InRa
                   
    hex_b:
    mov dl, 'B'
    jmp InRa
    
    hex_c:
    mov dl, 'C'
    jmp InRa
    
    hex_d:
    mov dl, 'D'
    jmp InRa
    
    hex_e:
    mov dl, 'E'
    jmp InRa
    
    hex_f:
    mov dl, 'F'
    jmp InRa    
    
    add dl, '0'
    
    InRa:
    mov ah, 2
    int 21h  
    loop ketQua 
    ret
printHexa endp
end main

.model small
.stack 100h
.data
    msg db 13, 10, 'Hexadecimal: $'
    str db 5 dup('$')         

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, str
    mov ah, 10
    int 21h
    
    mov cx, 0        
    mov cl, [str + 1]
    mov ax, 0
    mov bl, 10
    lea si, str + 2 
    
    Decimal:
    mul bl
    mov dl, [si]
    sub dl, '0'
    add ax, dx
    inc si
    loop Decimal
    
    lea dx, msg
    call printString
    
    call printHexa
    
    mov ah, 4ch
    int 21h
main endp

printString proc
    push ax
    mov ah, 9
    int 21h
    pop ax
    ret
printString endp

printHexa proc
    mov bl, 16
    mov cx, 0
    Hexa:
    mov ah, 0
    div bl
    mov dl, ah
    push dx   
    inc cx
    cmp al, 0
    jne Hexa
    
    InRa:
    pop dx
    cmp dl, 10
    je a
    cmp dl, 11
    je b
    cmp dl, 12
    je c
    cmp dl, 13
    je d
    cmp dl, 14
    je e
    cmp dl, 15
    je f
    add dl, '0'
    jmp print
    a:
    mov dl, 'A'
    jmp print
    b:
    mov dl, 'B'
    jmp print
    c:
    mov dl, 'C'
    jmp print
    d:
    mov dl, 'D'
    jmp print
    e:
    mov dl, 'E'
    jmp print
    f:
    mov dl, 'F'
    print:
    mov ah, 2
    int 21h
    loop Inra
    ret
printHexa endp
end main
        
    
    