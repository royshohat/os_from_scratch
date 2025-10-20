mov ah, 0x0e ; tty mode

mov bp, 0x8000 ; want it to be high enough to not get overwritten
mov sp, bp

push 'Y' ; push poshes only words (two bytes) even with me pushing only one byte 'Y'
push 'O'
push 'R'

pop bx ; pop can only pop full words as a correlation to push
mov al, bl ; takes the lower as we put only one bite 
int 0x10

; anoter two times over same principle 
pop bx
mov al, bl
int 0x10

pop bx
mov al, bl
int 0x10

jmp $

times 510-($-$$) db 0
dw 0xaa55
