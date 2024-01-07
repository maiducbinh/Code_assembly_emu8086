; Kiem tra doi xung
.model small
.stack 100
.data
    str db 10 dup('$')
    tb1 db 13, 10, 'Doi xung$'
    tb2 db 13, 10, 'Khong doi xung$'
.code
main proc
    mov ax, @data
    mov ds, ax 
    
    lea dx, str
    mov ah, 10
    int 21h
    
    lea si, str + 2
    mov cl, [str + 1]
    
    Reverse:
    mov ah, 0
    mov al, [si]
    push ax 
    inc si
    loop Reverse
    
    mov bx, 1  
    mov dx, 0
    lea si, str + 2
    mov cl, [str + 1]
    
    KiemTra:
    pop ax
    mov dl, [si]
    cmp al, dl
    je OK
    mov bx, 0
    jmp Thoat
    OK:   
    inc si
    loop KiemTra
    
    Thoat:
    cmp bx, 1
    je Doixung
    jmp Kodoixung
    
    Doixung:
    lea dx, tb1
    jmp InRa
    
    Kodoixung:
    lea dx, tb2
    jmp InRa
    
    InRa:
    mov ah, 9
    int 21h 
    
    mov ah, 4ch
    int 21h
main endp
end main