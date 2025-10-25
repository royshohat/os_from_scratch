disk_load:
    pusha

    mov ah, 0x02 ; specifies the function (ReadSector)
    mov al, 2; amount of sectors to read
    push ax ; pushing ax for error checking 
    ; dl is set to the current disk by defult
    mov dh, 0x00 ; disk number
    ; the user should set ex:bx when function is called
    mov ch, 0x00 ; the lower 8 bits of the 10 bit cylinder number
    mov cl, 0x02 ; sector number in the lower six bits

    int 0x13
    
    jc disk_error ; if the carray flag is set, error has been occured

    pop dx
    cmp dl, al ; ckeck whether the amount of sectors we tried reading earler actually been read
    jne sectors_error 
    popa
    ret

disk_error:
    mov bx, disk_err_str ; print the error 
    call print
    call print_nl

    ; print the error code
    xor dh, dh  
    mov dh, ah
    call printhex
    jmp disk_loop

sectors_error:
    mov bx, sectors_err_str ; print the error 
    call print

disk_loop:
    jmp $

    



disk_err_str:
    db 'disk read error', 0
sectors_err_str:
    db 'Incorrect number of sectors read', 0
    



