;Chuyen xau ve dang in hoa
.model small
.stack 100h
.data
    MSG1 DB 'Input a lowercase character: $'
    MSG2 DB 13, 10, 'Upper case character: '
    Char DB ?, '$'
    
.code
main proc
    mov ax, @data
    mov ds, ax
    
    lea dx, MSG1
    mov ah, 9
    int 21h
    
    mov ah, 1
    int 21h
    mov Char, al
    sub Char, 20h
    
    lea dx, MSG2
    mov ah, 9
    int 21h
    
    ;mov dl, Char
    ;mov ah, 2
    ;int 21h
    
    mov ah, 4ch
    int 21h
main endp
end main




