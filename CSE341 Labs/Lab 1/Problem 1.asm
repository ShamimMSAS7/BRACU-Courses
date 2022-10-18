.MODEL SMALL
.STACK 100h
.DATA
     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
            
            
        ;storing the values
        MOV AX, 24h
        MOV BX, 31h
        ;performing AX*BX 
        MUL BX 
        ;storing the product to  DX register
        MOV DX, AX
        
    
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN




