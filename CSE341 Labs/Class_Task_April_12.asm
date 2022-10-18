
.model small

saveReg macro R1, R2, R3 
    push R1
    push R2 
    push R3
endm

restoreReg macro S1,S2,S3 
    pop S1
    pop S2 
    pop S3
endm
copy macro source, destination, length 
    saveReg CX, SI, DI
    lea SI, source
    lea DI, destination
    CLD
    MOV CX, length 
    rep 
    movsb 
    restoreReg DI, SI, CX
endm

 
.data
    str2 dw "ABC$" 
    str1 dw "XYZ$"
.stack 3000h
.code
    mov ax, @data 
    mov ds, ax 
    
    mov es, ax
    copy str2, str1, 3 ;copies str2 to str1
    ;print string1 
    mov ah, 9
    lea dx, str1 
    int 21h
    
    mov ax, 4ch
    int 21h