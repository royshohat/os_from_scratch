[org 0x7c00]


mov bx, message
call print
call print_nl

mov bx, another_message
call print
call print_nl

mov dx, 0x22ef
call printhex
call print_nl

jmp $


%include "boot_sect_print.asm"
%include "boot_sect_printhex.asm"

message:
    db 'very secret message', 0
another_message:
    db 'another message', 0

times 510-($-$$) db 0
dw 0xaa55


