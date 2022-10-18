.model small
.stack 100h
.data 
    a db 50 dup(?)
    l dw 0
    initial_sp dw 0
    
.code

    main proc
        mov ax, @data
        mov ds, ax
        
        mov initial_sp, sp
        mov si, 0
    repeat: 
        mov ah, 1
        int 21h
        mov a[si], al
        inc l
        inc si
        cmp al, 0dh
    jne repeat
    
    
;going to new line where cursor will be at the beginning
            MOV AH, 2
            MOV DL, 0Dh
            INT 21h
            MOV DL, 0Ah
            INT 21h         
    
        dec l
        
        mov si, 0
        mov cx, l
        mov bh, 0
        

    start:
        cmp cx, 0
        jle last_printing
        mov bl, a[si]
        cmp bl, ' '
        je start_printing
        push bx
    back_to_start:
        inc si
        dec cx
    jmp start
    
    
    start_printing:
        cmp sp, initial_sp
        jge print_space
        pop dx
        mov ah, 2
        int 21h
        jmp start_printing
        
    last_printing:
        cmp sp, initial_sp
        jge exit
        pop dx
        mov ah, 2
        int 21h
        jmp last_printing
    
    print_space: 
        mov ah, 2
        mov dl, ' '
        int 21h
        jmp back_to_start    
    exit:
        mov ax, 4c00h
        int 21h    
    main endp
    end main




