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
        
            ;printing the prompt message
            MOV AH, 9
            LEA DX, MSG1
            INT 21h
            
            ;taking the input number and moving it to BL
            MOV AH, 1
            INT 21h
            MOV BL, AL
            
            ;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h
            
            
            ;printing the prompt message
            MOV AH, 9
            LEA DX, MSG2
            INT 21h
            
            ;taking the input number and moving it to BH
            MOV AH, 1
            INT 21h
            MOV BH, AL
            
            ;subtracting 30h from BL and BH to get the actual number in register 
            SUB BL, 30h
            SUB BH, 30h
            
            ;CH will store the sum of the numbers divided by 3, BL is loop controler and I am using explicit loop 
            MOV CH, 0
            MOV CL, 3    
        CALC_SUM:
            CMP BL, BH
            JG LOOP_EXIT
            MOV AH, 0
            MOV AL, BL
            DIV CL
            CMP AH, 0
            JNE INC_BL
            ADD CH, BL
            
        INC_BL:
            INC BL
            JMP CALC_SUM
            
        LOOP_EXIT:
            
            ;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h
            
            ;printing the prompt message
            MOV AH, 9
            LEA DX, MSG3
            INT 21h
            
            
            
            ;Now dividing the result by 10 to get two digit of answer
            MOV AH, 0
            MOV AL, CH
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
        
        
        
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN



