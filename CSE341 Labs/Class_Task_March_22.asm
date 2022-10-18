.model small
.stack 100h
.data
    a db 5 dup(?)
    msg1 db "No 9 given$"
    msg2 db "9 given$"
.code

    main proc
        mov ax, @data
        mov ds, ax
        
        
        
        mov cx, 5
        mov si, 0
        mov ah, 1
    start:
        int 21h
        mov a[si], al
        inc si
        
    Loop start
    
        mov ah, 2
        mov dl, 0dh
        int 21h
        mov dl, 0ah
        int 21h
    
    
        mov cx, 5
        mov si, 0
        mov al, 39h
    check_9:
        cmp al, a[si]
        je print_9
        inc si
    Loop check_9
    
        lea dx, msg1
        jmp print
    
    print_9:
        lea dx, msg2
        
    print:
        mov ah, 9
        int 21h   
        
        mov ax, 4c00h
        int 21h
        
        
    main endp
    end main




