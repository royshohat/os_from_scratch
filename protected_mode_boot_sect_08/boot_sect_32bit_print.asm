[bits 32] ; using 32 bit protected mode

; constants

VIDEO_MEMORY equ 0xb8000 ; the start of the memory region of vga graphics memory
WHITE_COLOR equ 0x0f

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

mov ah, WHITE_COLOR
print_string_pm_loop:
    mov al, [ebx] ; ebx will hold refrence to our string 
    
    cmp al, 0 ; check for null byte
    je print_string_pm_end

    mov [edx], eax ;put the char in place
    inc ebx ; inc the pointer to the string 
    add edx, 2 ; since every 2 byte difine one char need to jump two bytes

    jmp print_string_pm_loop 


print_string_pm_end:
   popa
   ret

