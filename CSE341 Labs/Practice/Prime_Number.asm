.MODEL SMALL
.STACK 100h
.DATA
    n db 0
    i db 0
    j db 0
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
    take_input:
        mov ah, 1
        int 21h
        cmp al, 0dh
        je out_taking_input
        sub al, 30h
        mov bl, al
        mov al, n
        mov cl, 10
        mul cl
        add al,bl
        mov n, al
        jmp take_input
        
   out_taking_input:
        
        
        
        ;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h 
        
        


        mov i, 2
    outer:
        mov al, i
        mov ah, n 
        cmp al, ah
        jg out_outer
        mov j, 2
    inner:
        mov al, i
        mov bl, j
        cmp bl, al
        jge out_inner
        
        mov ah, 0

        div bl
        cmp ah, 0
        je inc_i
        inc j
        jmp inner
        
    out_inner:
                    ;Now dividing the result by 10 to get two digit of answer
            MOV AH, 0
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
        ;going to new line where cursor will be at the beginning
        MOV AH, 2
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
   inc_i:    
        inc i
        mov j, 2
        jmp outer     
        
    out_outer:
        
        
        
        

        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN