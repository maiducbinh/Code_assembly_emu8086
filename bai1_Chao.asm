;Hien thi loi chao
.Model Small
.Stack 100h
.Data
    ChaoTa  DB 'Chao ban!$'
    ChaoTay DB 'Hello!$'
    CRLF    DB 13, 10, '$'
    
 .Code
 Main PROC
    MOV AX, @Data
    MOV DS, AX
    LEA DX, ChaoTa
    MOV AH, 9
    INT 21H
    
    LEA DX, CRLF
    MOV AH, 9
    INT 21H
    
    LEA DX, ChaoTay
    MOV AH, 9
    INT 21H
    
    MOV AH, 4CH
    INT 21H
Main ENDP
END Main