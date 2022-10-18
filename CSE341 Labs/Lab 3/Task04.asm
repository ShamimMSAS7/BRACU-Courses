.MODEL SMALL
.STACK 100h
.DATA
    msg1 db "equilateral$"
    msg2 db "isosceles$"
    msg3 db "neither$"
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
            
            ;storing 3 sides in 3 register AX, BX, CX
            MOV AX, 5
            MOV BX, 9
            MOV CX, 8
            
            ;checking if first 2 sides are equal or not
            CMP AX, BX
            JE CHECK_EQUI
            
            ;first 2 sides are not equal so checking if any of them are equal to the third one or not
            CMP AX, CX
            JE LOAD_MSG2
            
            CMP BX, CX
            JE LOAD_MSG2
            
            ;all the sides are unequal
        LOAD_MSG3:
            LEA DX, MSG3
            JMP PRINT
            
            ;first two sides are equal. now checking if the third side is equal or not
        CHECK_EQUI:
            CMP BX, CX
            JE LOAD_MSG1
            
        LOAD_MSG2:
            LEA DX, msg2
            JMP PRINT
            
        LOAD_MSG1:
            LEA DX, msg1
            
        PRINT:
            MOV AH, 9
            INT 21h
        
    
        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN



