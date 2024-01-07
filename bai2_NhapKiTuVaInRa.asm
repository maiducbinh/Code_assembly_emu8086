;Nhap ky tu va in ra
.model small
.stack 100h
.data
    MSG1 DB 'Nhap ky tu: $'
    MSG2 DB 13, 10, 'Ky tu vua nhap: $'
    KyTu DB ?

.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, MSG1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h   
    mov KyTu, al
    
    lea dx, MSG2
    mov ah, 9
    int 21h
    
    mov dl, KyTu
    mov ah, 2
    int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main



