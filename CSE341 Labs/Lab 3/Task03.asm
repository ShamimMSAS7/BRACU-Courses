.MODEL SMALL
.STACK 100h
.DATA 
    msg1 db "Leap year$"
    msg2 db "Not a leap year$"
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
            
            ;storing the year in CX register
            MOV CX, 2022
            MOV AX, CX
            MOV DX, 0
            
            ;dividing by 400 to check whether it's leap year or not.
            MOV BX, 400
            DIV BX
            CMP DX, 0
            JE LOAD_MSG1
            
            ;again storing the values and dividing by 100. if it's divisible then not a leap year.
            MOV AX, CX
            MOV DX, 0
            MOV BX, 100
            DIV BX
            CMP DX, 0
            JE LOAD_MSG2
            
            ;again storing the values and checking whether it's divisible by 4 or not
            MOV AX, CX
            MOV DX, 0
            MOV BX, 4
            DIV BX
            CMP DX, 0
            JE LOAD_MSG1
            
            ;if it's not divisible then it's not a leap year.
            
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



