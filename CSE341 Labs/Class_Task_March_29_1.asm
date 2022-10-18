.model small
.stack 100h
.data
    
.code

    main proc
        mov ax, @data
        mov ds, ax
        
        mov cx, 0
    repeat: 
        mov ah, 1
        int 21h
        mov ah, 0
        push ax
        inc cx
        cmp al, 0dh
        jne repeat
        
        ;popping up the carraige
        pop dx
        dec cx 
        
        ;going to new line of console
        mov ah, 2
        mov dl, 0ah
        int 21h
        
    print:
        pop dx
        int 21h
    loop print
          
        
        mov ax, 4c00h
        int 21h
        
        
    main endp
    end main




