.model small
.stack 100h
.data 
    space_counter db 0
    initial_sp dw ?
    final_sp dw ? 
    a dw ?
    
.code

    main proc
        mov ax, @data
        mov ds, ax
        
        mov initial_sp, sp
    repeat: 
        mov ah, 1
        int 21h
        mov ah, 0
        push ax
        cmp al, 0dh
    jne repeat
        
    
        
        ;popping up the carraige
        pop dx
        mov final_sp, sp 
        mov a, ss
        mul a, 10h
        
        add a, sp
        mov dx, a 
        mov ah, 2
        int 21h  
        
    count_space:
        cmp sp, initial_sp
        je go_to_new_line
        pop ax
        cmp al, " "
        jne count_space
        inc space_counter
        jmp count_space 
        
        
    go_to_new_line:    
        ;going to new line of console
        mov ah, 2
        mov dl, 0ah
        int 21h
        
        
        
    print:
        mov sp, final_sp
        cmp space_counter, 0
        jl exit
        mov bl, space_counter 
        
        inner:
            pop dx  
            cmp dl, " "
            jne back_to_inner2
            dec bl
            jmp inner 
            
        back_to_inner2:
            cmp bl, 0
            jg inner
            cmp bl, 0
            jl jmp_to_print
            cmp sp, initial_sp 
            jge jmp_to_print
            mov ah, 2
            int 21h  
            jmp inner
             
    jmp_to_print:
        mov dl, " "
        int 21h  
        dec space_counter  
        jmp print 
     
   
    exit:     
        mov ax, 4c00h
        int 21h
        
        
    main endp
    end main





