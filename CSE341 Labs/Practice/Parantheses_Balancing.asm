.model small
.stack 100h
.data 
    a db 50 dup(?)
    l dw 0
    initial_sp dw 0
    balance db "balanced$"
    imbalance db "imbalanced$"
    
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
        jle check_stack
        mov bl, a[si]
        cmp bl, '('
        je pushing
        cmp bl, '{'
        je pushing
        cmp bl, '['
        je pushing
        cmp bl, ')'
        je popping
        cmp bl, '}'
        je popping
        cmp bl, ']'
        je popping
    back_to_start:
        dec cx
        inc si
        jmp start
    after_pop:
        cmp dx, '('
        je check_bx_first
        cmp dx, '{'
        je check_bx_second
        cmp dx, '['
        je check_bx_third
        
    check_bx_first:
        cmp bx, ')'
        jne print_imbalanced
        jmp back_to_start 
        
    check_bx_second:
        cmp bx, '}'
        jne print_imbalanced
        jmp back_to_start
    
    check_bx_third:
        cmp bx, ']'
        jne print_imbalanced
        jmp back_to_start
        
        
    pushing:
        push bx
        jmp back_to_start
        
    popping:
        pop dx
        jmp after_pop
        
        
    check_stack:
        cmp initial_sp, sp
        jne print_imbalanced
        lea dx, balance
        mov ah, 9
        int 21h
        jmp exit
        
    print_imbalanced:
        lea dx, imbalance
        mov ah, 9
        int 21h
        
            
    exit:
        mov ax, 4c00h
        int 21h    
    main endp
    end main
