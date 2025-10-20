printhex:
    pusha
    
    mov cx, 0

step1:
    cmp cx, 4
    je end2

    mov ax, dx
    and ax, 0x000f
    cmp ax, 0x9
    jle step2
    add ax, 0x27 ; the diffrence between ascii 9 and ascii a


step2:
    add ax, 0x30 ; the diff between hex 0x0 and ascii 0
    
    mov bx, str + 5  ; start finding the right index in the string 
    sub bx, cx 
    mov [bx], al ; has to be al here cause if we are moving ax it will corrupt the data

    add cx, 1 ;increment the counter

    shr dx, 4 ; to make the next chr last 

    jmp step1


str: 
    db '0x0000', 0


end2:
    mov bx, str
    call print
    popa
    ret
