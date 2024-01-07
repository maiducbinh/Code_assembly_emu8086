;Nhap vao xau va in ra
.model small
.stack 100h
.data
    MSG DB 13, 10, 'Xau vua nhap la: $'
    str DB 100 dup('$')
    
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
    
    lea dx, str + 2
    mov ah, 9
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main
    
    



