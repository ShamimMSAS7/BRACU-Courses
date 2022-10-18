.MODEL SMALL
.STACK 100h
.DATA 
    ;declaring and assigning value in the variable
    A dw 18h
     
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX
        
        ;storing the value of the variable in a register
        MOV AX, A
        ;performing -(A+1) since AX holds the value of A
        INC AX
        NEG AX
        ;again storing the updated value in the variable
        MOV A, AX
        
    
        MOV AX, 4C00H
        INT 21h
        
    MAIN ENDP
    END MAIN




