; GDT
gdt_start:
gdt_null:
    ; the GDT has to start with a null 8-byte
    dd 0x0
    dd 0x0
     
    
gdt_code: ; the cs desc
    ; base 0x0, limit = 0xfffff
    ; 1st flags: present 1; priviege 0; descriptor type 1 --> 1001b
    ; type flags: code 1; conforming 0; readable 1; accessed 0 --> 1010b
    ; 2nd flags: granularity 1; 32-bit 1; 64 bit seg 0; avl 0; --> 1100b
    dw 0xffff ; Limit ( bits 0 -15)
    dw 0x0 ; Base ( bits 0 -15)
    db 0x0 ; Base ( bits 16 -23)
    db 10011010b ; 1st flags , type flags
    db 11001111b ; 2nd flags , Limit ( bits 16 -19)
    db 0x0 ; Base ( bits 24 -31)
    
gdt_data: ; the ds desc
    ; same as code segment execpt for the type flags
    ; type flags: code 0; expand down 0; writeable 1; accessed 0; --> 0010b
    dw 0 xffff ; Limit ( bits 0 -15)
    dw 0x0 ; Base ( bits 0 -15)
    db 0x0 ; Base ( bits 16 -23)
    db 10010010b ; 1st flags , type flags
    db 11001111b ; 2nd flags , Limit ( bits 16 -19)
    db 0x0 ; Base ( bits 24 -31) 

gdt_end: ; label for calcs
    

gdt_descriptor:
    ; gdt descriptor needs to have size of gdt 16 bits 
    ; and start address 32 bits
    dw gdt_end - gdt_start - 1 ; size of gdt always less 1
    dd gdt_start  

; define constants that will be usefull later
CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt start
; data is accessed through offests and not actual address


    
