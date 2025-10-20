[org 0x7c00] ; setting the global offest to the offest of the boot sector
mov ah, 0x0e ; tty mode

mov al, [message] ; no need for counting for the offest any more
int 0x10

jmp $

message:
    db 'x'

times 510-($-$$) db 0
dw 0xaa55

