.MODEL SMALL
.STACK 100h
.DATA
    MSG1 db "Enter a number:$" 
    MSG2 db "The sum is $"
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
            ;printing the prompt message
            MOV AH, 9
            LEA DX, msg1
            INT 21h
            
            ;taking the input number and moving it to BL
            MOV AH, 1
            INT 21h
            MOV BL, AL
            
            ;variable BH will contain the sum, subtracting 30h from BL to get the actual number in register and I am using implicit loop
            MOV BH, 0 
            SUB BL, 30h
            MOV CX, 5    
        CALC_SUM:
            ADD BH, BL
            ADD BL, 4
        LOOP CALC_SUM
            
            ;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h
            
            ;Now dividing the sum by 10 to get two digit of answer
            MOV AH, 0
            MOV AL, BH
            MOV BL, 10
            DIV BL
            
            
            ;adding 30h with both remainder and quotient to find the ascii code of the values
            ADD AH, 30h
            ADD AL, 30h
            MOV BX, AX
            
            
            
            ;printing the output
            MOV AH, 9
            LEA DX, msg2
            INT 21h 
            
            MOV AH, 2
            MOV DL, BL
            INT 21h
            MOV DL, BH
            INT 21h
        
        
        
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN


