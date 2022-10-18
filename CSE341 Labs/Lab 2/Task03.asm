.MODEL SMALL
.STACK 100h
.DATA
    msg1 db "Enter First Initial: $"
    msg2 db "Enter Second Initial: $"
    msg3 db "Enter Third Initial: $"
     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        
        
        ;printing the string inside msg1    
        MOV AH, 9
        LEA DX, msg1
        INT 21h
        
        ;taking first initial as input and moving the input to BL 
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
        
        ;taking second initial as input and moving the input to BH 
        MOV AH, 1
        INT 21h
        MOV BH, AL
        
        ;going to new line where cursor will be at the beginning
        MOV AH, 2
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        ;printing the string inside msg3    
        MOV AH, 9
        LEA DX, msg3
        INT 21h
        
        ;taking third initial as input and moving the input to CL 
        MOV AH, 1
        INT 21h
        MOV CL, AL
        
        ;going to new line where cursor will be at the beginning
        MOV AH, 2
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        ;moving the value of CL to DL and printing the third initial 
        MOV DL, CL
        INT 21h
        
        ;going to new line where cursor will be at the beginning
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        ;moving the value of BH to DL and printing the second initial 
        MOV DL, BH
        INT 21h
        
        ;going to new line where cursor will be at the beginning
        MOV DL, 0Dh
        INT 21h
        MOV DL, 0Ah
        INT 21h
        
        ;moving the value of BL to DL and printing the first initial 
        MOV DL, BL
        INT 21h
        
        
    
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN


