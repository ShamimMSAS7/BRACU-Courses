.model small
.stack 100h
.data
    a db 1,5,7,3,0
.code

    main proc
        mov ax, @data
        mov ds, ax
        
        
        
        mov cx, 4
        mov di, 0
    outer:
        mov al, a[di]
        mov si, di
        inc si
        
    inner:
        cmp si, 5
        jge out_inner
        cmp a[si], al
        jl swap
    back_inner:
        inc si
        jmp inner
        
    swap:
        mov bl, a[si]
        mov a[si], al
        mov a[di], bl
        mov al, bl
        jmp back_inner    
        
    out_inner:
        inc di

        
    Loop outer
    
        
    
    
        mov ah, 2
        mov cx, 5
        lea si, a
        
    print:
        mov dl, [si]
        add dl, 30h
        int 21h
        inc si
        
    Loop print   
        
        mov ax, 4c00h
        int 21h
        
        
    main endp
    end main




