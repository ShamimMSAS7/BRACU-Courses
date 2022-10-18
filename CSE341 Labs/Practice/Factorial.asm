
.MODEL SMALL


.DATA

        
.STACK 100h    
.CODE 
 fac proc
    start:
        cmp bx, 0
        je finish
        mul bx
        dec bx
        jmp start
    finish:
        ret
        fac endp
 
 
    MAIN PROC
        MOV AX, @DATA
        MOV DS, AX 
        
        
        mov ax, 1
        mov bx, 6  
        call fac

        
           

            mov bx, sp
            
            ;Now dividing the result by 10 to get two digit of answer
        pushing:    
            MOV CL, 10
            DIV CL
            mov ch, al
            mov al, ah
            mov ah, 0
            push ax
            cmp ch, 0
            je start_printing
            mov al, ch
            mov ah, 0
            jmp pushing
        
        start_printing:
            cmp bx, sp
            jle exit
            pop dx
            add dx, 30h
            mov ah, 2
            int 21h
            jmp start_printing
            
            
     

        
        
        
        
        
        
        
    exit:    

        MOV AX, 4C00h
        INT 21h
        
    MAIN ENDP
    END MAIN
    
