.MODEL SMALL
.STACK 100h
.DATA
    MSG1 db 'how many numbers (1-9) do you want to enter? $'
    MSG2 db 'Enter a hex value 0-9 or A-F(capital letter): $'
    MSG3 db 'Sum is: $'
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
            ;printing the prompt message
            MOV AH, 9
            LEA DX, MSG1
            INT 21h
            
            ;taking the input number and moving it to CL
            MOV AH, 1
            INT 21h
            MOV CL, AL 
            
            ;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h 
            
            ;subtracting 30h from CL to get the actual number in register
            SUB CL, 30h
            MOV CH, 0
            MOV BH, 0
            
            ;I am using implicit loop to take the inputs and adding them to BH
        CALC_SUM:
            ;printing the prompt message
            MOV AH, 9
            LEA DX, MSG2
            INT 21h
            
            MOV AH, 1
            INT 21h
            CMP AL, 65
            JGE GTE10
            SUB AL, 48
            JMP ADD_NUM    
        GTE10:
            SUB AL, 55
            
        ADD_NUM:
            ADD BH, AL
            
            ;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h
            
        LOOP CALC_SUM
            
            
            ;printing the prompt message
            MOV AH, 9
            LEA DX, MSG3
            INT 21h
            
            
            ;Now dividing the result by 10h to get two digit of answer
            MOV AH, 0
            MOV AL, BH
            MOV CL, 10h
            DIV CL
            MOV DX, AX
            
            
            
            
            ;printing the output
            MOV AH, 2
            
            ;checking whether the sum is of two digit or one digit 
            CMP DL, 0
            JE ONE_DIGIT
            
            ;checking whether the digit is greater than or equal to 10 or not
            CMP DL, 10
            JGE ADD55
            ADD DL, 48
            INT 21h
            JMP ONE_DIGIT
            
        ADD55: 
            ADD DL, 55
            INT 21h
            
        ONE_DIGIT:
            MOV DL, DH
            ;checking whether the digit is greater than or equal to 10 or not
            CMP DL, 10
            JL ADD48
            ADD DL, 55
            INT 21h
            JMP EXIT
            
        ADD48: 
            ADD DL, 48
            INT 21h
        
        
        EXIT:
            MOV AX, 4C00h
            INT 21h
        
    MAIN ENDP
    END MAIN




