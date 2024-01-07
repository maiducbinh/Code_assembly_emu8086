.model small
.stack 100h
.data
    str1 db 'aBgH45fiK1'
         db 13, 10, '$'
    str2 db 10 dup(' ')
         db '$'
         
.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax
    cld
    mov cx, 10
    lea si, str1
    lea di, str2
    start:
    lodsb
    cmp al, 'a'
    jl NotLowerCase
    cmp al, 'z'
    jg NotLowerCase
    sub al, 20h
    NotLowerCase:
    stosb
    loop start
        
    lea dx, str1
    call printString
    
    lea dx, str2
    call printString
    
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
end main