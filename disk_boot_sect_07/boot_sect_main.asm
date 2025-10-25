[org 0x7c00]

mov bp, 0x8000 ; set the stack away from the code
mov sp, bp

; we will try reading to memory es:bx = 0x0 : 0x9000
;es has to be zero from init
mov bx, 0x9000 ; the data will be copied to here

call disk_load

; print the readen data 
mov dx, [0x9000]
call printhex

call print_nl

mov dx, [0x9000 + 512]
call printhex

jmp $

%include "../print_function_sect_05/boot_sect_print.asm"
%include "../print_function_sect_05/boot_sect_printhex.asm"
%include "boot_sect_diskloader.asm"

times 510-($-$$) db 0
dw 0xaa55

;cyl 0 head 0 hdd 0
times 256 dw 0xdada ; sector 2
times 512 dw 0xbaba ; sector 3

