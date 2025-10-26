; goal: drawing a square
mov ax, 0x13 ;graphics mode
int 0x10 
mov ax, 0xA000 ; where the region of vram starts
mov es, ax


mov al, 4 ; color red

xor di, di

loop1:
    stosb ; automaticaly inc di, set the adress in es:di to the color of al
    cmp di, 320 ; the screen is 320x200 pixels 
    jl loop1 ; jl, lg is an unsigned instraction the thing that should be used

mov al, 10 ; color green

mov di, 320

loop2:
    stosb
    add di, 318
    stosb
    cmp di, 63680 ; 320 * 199 dont want to include the last raw
    jb loop2

mov al, 6 ; orange color

mov di, 63680
loop3:
    stosb
    cmp di, 64000
    jl loop3
    
   

jmp $

times 510-($-$$) db 0
dw 0xaa55

