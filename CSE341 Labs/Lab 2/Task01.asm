.MODEL SMALL
.STACK 100h
.DATA
    msg db "Enter a number$"
     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
            
        ;printing the string inside msg    
        MOV AH, 9
        LEA DX, msg
        INT 21h
        
        ; going to new line where cursor will be at the beginning
        MOV AH, 2
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
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
        
        ;moving the value of BL to DL and increasing the value by 1 and at last printing the new value 
        MOV DL, BL
        INC DL
        INT 21h
        
        
    
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN