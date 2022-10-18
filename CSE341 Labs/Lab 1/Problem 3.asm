.MODEL SMALL
.STACK 100h
.DATA
     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ;storing the values
        MOV AX, 09
        MOV BX, 07
        ; swapping the values using AL, BH, BL (no third register used) 
        MOV BH, AL
        MOV AL, BL
        MOV BL, BH
        MOV BH, 00h
        
    
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN


