.MODEL SMALL
.STACK 100h
.DATA
    msg1 db "ENTER A HEX DIGIT: $"
    msg2 db "IN DECIMAL IT IS $"
     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        
        
        ;printing the string inside msg1    
        MOV AH, 9
        LEA DX, msg1
        INT 21h
        
        ;taking HEX digit as input and moving the input to BL 
        MOV AH, 1
        INT 21h
        MOV BL, AL
        
        ;going to new line where cursor will be at the beginning
        MOV AH, 2
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        ;printing the string inside msg2    
        MOV AH, 9
        LEA DX, msg2
        INT 21h
        
        ;printing 1(ascii value 49) cause 10(A) to 15(F) all numbers start with 1
        MOV AH, 2
        MOV DL, 49
        INT 21h
        
        ;printing the lsb of the decimal number by subtracting the difference between ascii values(ascii of A - ascii of 0=17) since ascii values are sequental for numbers and letters
        MOV DL, BL
        SUB DL, 17
        INT 21h
        
        
    
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN


