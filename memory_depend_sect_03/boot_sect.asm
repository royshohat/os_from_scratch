mov ah, 0x0e ; tty mode


mov bx, 0x7c00
add bx, message ; have to calculate the offest of the message not from the start of the code but from the start of the memory since the boot sect starts at 0x7c00
mov al, [bx]
int 0x10

jmp $

message:
    db 'x'

times 510-($-$$) db 0
dw 0xaa55
