.MODEL SMALL
.STACK 100h
.DATA
     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ; I'm doing the calculation considering the data is in word form.
        MOV AX, 8A3h
        MOV BX, 12h 
        ;performing DX:AX/BX and in our case DX contains 0000h
        DIV BX
        ; After executing this line our remainder is stored in DX and the quotient is stored in AX
    
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN




