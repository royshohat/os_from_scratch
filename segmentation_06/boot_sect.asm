mov ah, 0x0e

; this wont work as the message actually the offest from the start of the code and not the actual adress in disk
mov al, [message]
int 0x10


mov bx, 0x7c0
mov es, bx 
mov al, [es:message] ; the cpu built as segment:offset so it will work fine too
int 0x10


mov bx, 0x7c0 ; the adress of the code before the segment calc
mov ds, bx
; this now will work cause the register ds has the offest   
mov al, [message]
int 0x10






jmp $

message:
    db 'X'

times 510-($-$$) db 0
dw 0xaa55
