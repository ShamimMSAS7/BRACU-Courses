
.model small


fib macro n
    
    
        mov cx, n
        sub cx, 30h
        mov bl, 0
        mov bh, 1
Start: 
       cmp cx, 0 
       je fibexit
       ;Now dividing the result by 10 to get two digit of answer
       MOV AH, 0
       MOV AL, BL
       MOV dl, 10
       DIV dl
       ;adding 30h with both remainder and quotient to find the ascii code of the values
       ADD AH, 30h
       ADD AL, 30h
       MOV DX, AX
            
            
            
       ;printing the output
       MOV AH, 2
            
       ;checking whether the sum is of two digit or one digit 
       CMP DL, 30h
       JE ONE_DIGIT
       INT 21h
            
       ONE_DIGIT:
       MOV DL, DH
       INT 21h
     

                ;going to new line where cursor will be at the beginning
       MOV AH, 2
       MOV DL, 0Dh
       INT 21h
       MOV DL, 0Ah
       INT 21h
       mov dl, bh
       add bh, bl
       mov bl, dl
       sub cx, 1
       jmp start
fibexit:    
    
    
    endm

 
.data

.stack 3000h
.code
    mov ax, @data 
    mov ds, ax 
    
    mov ah, 1
    int 21h
    mov ah, 0 
    mov cx, ax
                    ;going to new line where cursor will be at the beginning
   MOV AH, 2
   MOV DL, 0Dh
   INT 21h
   MOV DL, 0Ah
   INT 21h
    fib cx
    
    mov ax, 4ch
    int 21h



