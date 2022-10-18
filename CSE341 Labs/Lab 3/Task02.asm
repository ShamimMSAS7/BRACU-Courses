.MODEL SMALL
.STACK 100h
.DATA 
    msg1 db "Good Morning$"
    msg2 db "Good Afternoon$"
    msg3 db "Good Night$"
    msg4 db "Invalid$"
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
            
            ;keeping the hour at AL and checking the conditions
            MOV AL, 5
            CMP AL, 0
            JL LOAD_MSG4
            
            CMP AL, 12
            JL LOAD_MSG1
            
            CMP AL, 20
            JL LOAD_MSG2
            
            CMP AL, 23
            JLE LOAD_MSG3
            
        LOAD_MSG4:
            LEA DX, msg4
            JMP PRINT
        
        LOAD_MSG1:
            LEA DX, msg1
            JMP PRINT
            
        LOAD_MSG2:
            LEA DX, msg2
            JMP PRINT
            
        LOAD_MSG3:
            LEA DX, msg3
            
        PRINT:
            MOV AH, 9
            INT 21h
        
    
      MOV AX, 4C00h
      INT 21h
        
    MAIN ENDP
    END MAIN



