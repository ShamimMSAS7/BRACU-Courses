.MODEL SMALL
.STACK 100h
.DATA
    msg db "All the given numbers are even$"
    
.CODE
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
            ;CH will contain the sum of odd numbers and CL will contain the count of odd numbers
            MOV CL, 0
            MOV CH, 0
            
            ;taking the first digit as input and moving the input to BH 
            MOV AH, 1
            INT 21h
            MOV BH, AL
            
            ;performing division to find out the remainder
            MOV AH, 0
            MOV BL, 2
            DIV BL
            
            ;checking whether the number is odd or even
            CMP AH, 0
            JE TAKE_INPUT2
            ADD CH, BH
            INC CL
        
        TAKE_INPUT2:
             
        
            ;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h
        
            ;taking the second digit as input and moving the input to BH 
            MOV AH, 1
            INT 21h
            MOV BH, AL
            
            ;performing division to find out the remainder
            MOV AH, 0
            MOV BL, 2
            DIV BL
            
            ;checking whether the number is odd or even
            CMP AH, 0
            JE TAKE_INPUT3
            ADD CH, BH
            INC CL
            
         TAKE_INPUT3:
             
        
            ;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h
        
            ;taking the third digit as input and moving the input to BH 
            MOV AH, 1
            INT 21h
            MOV BH, AL
            
            ;performing division to find out the remainder
            MOV AH, 0
            MOV BL, 2
            DIV BL
            
            ;checking whether the number is odd or even
            CMP AH, 0
            JE PRINT_OUTPUT
            ADD CH, BH
            INC CL
          
          
          PRINT_OUTPUT: 
          
            ; going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h 
            
            ;checking if there is any odd number or not
            CMP CL, 0
            JE NO_ODD
            
            ;performing division to find out the mean
            MOV AL, CH
            MOV AH, 0
            DIV CL
            
            ;printing the output
            MOV DL, AL
            MOV AH, 2
            INT 21h
            JMP EXIT
         
         NO_ODD:
            LEA DX, msg
            MOV AH, 9
            INT 21h
        
        EXIT:
            MOV AX, 4C00h
            INT 21h
        
    MAIN ENDP
    END MAIN


