;Tong cac so chia het cho 7
.model small
.stack 100h
.data
    arr db 7,5,60,233,77,70 
    tb  db 'Tong: $'
.code       
main proc
    mov ax, @data
    mov ds, ax
    
    lea si, arr
    mov bx, 0
    mov dl, 7
    
    tong:
    mov ah, 0
    mov al, [si]
    mov cx, ax
    div dl
    cmp ah, 0
    jne NotDivisible
    add bx, cx
    NotDivisible:
    inc si
    cmp si, 6
    je endTong
    jmp tong
    
    endTong:
    mov ax, bx
    call printNumber
    
    mov ah, 4ch
    int 21h
main endp

printNumber proc
    mov cx, 0
    mov bl, 10
    
    tinh:     
    inc cx
    mov ah, 0
    div bl   
    push ax
    cmp al, 0
    je Thoat
    jmp tinh
    
    Thoat:
    InRa:
    pop ax
    mov dl, ah
    add dl, '0'
    mov ah, 2
    int 21h
    loop InRa
    
    ret
printNumber endp
end main
    