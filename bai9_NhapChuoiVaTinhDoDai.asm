;nhap vao chuoi va tinh do dai
;str + 1 da luu do dai chuoi, tuy nhien do dai chuoi co the > 10 => ko the in binh thuong

.model small 
.stack 100h
.data
    msg db 13, 10, 'Do da chuoi: $'
    str db 50 dup('$')
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, str
    mov ah, 10
    int 21h
    
    lea dx, msg
    mov ah, 9
    int 21h
    
    mov cx, 0  
    mov ah, 0
    mov al, [str + 1]   
    mov bx, 10
    
    Chia: 
    mov dx, 0
    div bx; 
    push dx 
    inc cx
    cmp ax, 0
    je Thoat
    jmp chia
    
    Thoat:
    mov ah, 2
    
    InRa:
    pop dx
    add dl, '0'
    int 21h     
    loop InRa
    
    mov ah, 4ch
    int 21h     
main endp
end main   

;Code 2:
.model small 
.stack 100h
.data
    msg db 13, 10, 'Do da chuoi: $'
    str db 50 dup('$')
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, str
    mov ah, 10
    int 21h
    
    lea dx, msg
    mov ah, 9
    int 21h
    
    mov cx, 0  
    mov al, [str + 1]   
    mov bl, 10
    
    Chia: 
    mov ah, 0
    div bl;
    mov dl, ah 
    push dx 
    inc cx
    cmp al, 0
    je Thoat
    jmp chia
    
    Thoat:
    mov ah, 2
    
    InRa:
    pop dx
    add dl, '0'
    int 21h     
    loop InRa
    
    mov ah, 4ch
    int 21h     
main endp
end main
    