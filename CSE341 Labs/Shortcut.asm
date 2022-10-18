;Start
.MODEL SMALL
.STACK 100h
.DATA
    MSG1 db "Enter First Number: $" 
    MSG2 db "Enter Second Number: $"
    MSG3 db "Output: $"
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        
        
        
        
        
        
        
        
        
        
        
        
;end
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN
    
    
    
    
    
    
    
    
    
    
    
    
    
;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h    
    


















;printing two/one digit output

            ;Now dividing the result by 10 to get two digit of answer
            MOV AH, 0
            MOV AL, BL
            MOV CL, 10
            DIV CL
            
            
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









;printing more than 1 digit where the value is in ax
            mov bx, sp
            
            
        pushing:    
            MOV CL, 10
            DIV CL
            mov ch, al
            mov al, ah
            mov ah, 0
            push ax
            cmp ch, 0
            je start_printing
            mov al, ch
            mov ah, 0
            jmp pushing
        
        start_printing:
            cmp bx, sp
            jle exit
            pop dx
            add dx, 30h
            mov ah, 2
            int 21h
            jmp start_printing