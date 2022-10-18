.MODEL SMALL
.STACK 100h
.DATA
     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        
        ;taking input and moving the input to BL 
        MOV AH, 1
        INT 21h
        MOV BL, AL
        
        ;going to new line where cursor will be at the beginning
        MOV AH, 2
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        ;moving the value of BL to DL and increasing the value by 20h for the ascii value of lower case and at last printing the new value 
        MOV DL, BL
        ADD DL, 20h
        INT 21h
        
        
    
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN

