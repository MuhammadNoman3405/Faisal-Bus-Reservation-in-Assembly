section .data
    MAX_SEATS       equ 20
    NAME_LEN        equ 30

    header      db 0xA, "--- FAISAL TRAVEL AGENCY (20 SEATS) ---", 0xA, 0
    menuMsg     db 0xA, "1. Book Ticket", 0xA, "2. Show Status", 0xA, "8. Exit", 0xA, "Choice: ", 0
    seatPrompt  db "Enter Seat Number (1-20): ", 0
    namePrompt  db "Enter Passenger Name: ", 0
    successMsg  db "Done!", 0xA, 0
    errorMsg    db "Error: Invalid Seat or Already Taken!", 0xA, 0
    statusHead  db 0xA, "Seat | Status    | Name", 0xA, "---------------------------", 0xA, 0
    availStr    db "Available ", 0
    bookedStr   db "Booked    ", 0
    spacer      db " | ", 0
    newline     db 0xA, 0

    ; Data Arrays
    seats       times MAX_SEATS db 0             ; 0=Empty, 1=Booked
    names       times MAX_SEATS * NAME_LEN db 0  ; 20 slots of 30 bytes

section .bss
    choice      resb 4
    inputBuf    resb 10
    tempSeat    resd 1

section .text
    global _start

_start:
    mov esi, header
    call print_string

main_menu:
    mov esi, menuMsg
    call print_string
    call read_input
    
    mov al, [inputBuf]
    cmp al, '1'
    je book_ticket
    cmp al, '2'
    je show_status
    cmp al, '8'
    je exit_prog
    jmp main_menu

book_ticket:
    mov esi, seatPrompt
    call print_string
    call read_input
    call ascii_to_int   ; Converts inputBuf to integer in EAX
    
    ; Validate 1-20
    cmp eax, 1
    jl booking_error
    cmp eax, 20
    jg booking_error

    dec eax             ; Convert to 0-index
    mov ebx, eax
    
    cmp byte [seats + ebx], 0
    jne booking_error

    mov byte [seats + ebx], 1

    ; Get Name
    mov esi, namePrompt
    call print_string
    
    imul edx, ebx, NAME_LEN
    lea ecx, [names + edx]
    mov eax, 3          ; sys_read
    mov ebx, 0
    mov edx, NAME_LEN
    int 0x80

    mov esi, successMsg
    call print_string
    jmp main_menu

booking_error:
    mov esi, errorMsg
    call print_string
    jmp main_menu

show_status:
    mov esi, statusHead
    call print_string
    
    mov edi, 0
.loop:
    cmp edi, MAX_SEATS
    je main_menu

    ; Print Seat Number
    mov eax, edi
    inc eax
    call print_int

    mov esi, spacer
    call print_string

    ; Status
    mov esi, availStr
    cmp byte [seats + edi], 1
    jne .print_name
    mov esi, bookedStr

.print_name:
    call print_string
    mov esi, spacer
    call print_string

    ; Name
    imul edx, edi, NAME_LEN
    lea esi, [names + edx]
    call print_string

    inc edi
    jmp .loop

exit_prog:
    mov eax, 1
    xor ebx, ebx
    int 0x80

; --- UTILITY FUNCTIONS ---

print_string:
    pusha
    mov edx, 0
.count:
    cmp byte [esi + edx], 0
    je .done
    inc edx
    jmp .count
.done:
    mov eax, 4
    mov ebx, 1
    mov ecx, esi
    int 0x80
    popa
    ret

read_input:
    mov eax, 3
    mov ebx, 0
    mov ecx, inputBuf
    mov edx, 10
    int 0x80
    ret

ascii_to_int:
    xor eax, eax
    mov esi, inputBuf
.loop:
    movzx ecx, byte [esi]
    cmp cl, 10 ; newline
    je .done
    cmp cl, 0
    je .done
    sub cl, '0'
    imul eax, 10
    add eax, ecx
    inc esi
    jmp .loop
.done:
    ret

print_int:
    ; Simplified integer print for 1-20
    pusha
    cmp eax, 9
    jle .single_digit
    ; Print '1' or '2'
    xor edx, edx
    mov ebx, 10
    div ebx
    add eax, '0'
    mov [choice], al
    add edx, '0'
    mov [choice+1], dl
    mov eax, 4
    mov ebx, 1
    lea ecx, [choice]
    mov edx, 2
    int 0x80
    jmp .done
.single_digit:
    add eax, '0'
    mov [choice], al
    mov eax, 4
    mov ebx, 1
    mov ecx, choice
    mov edx, 1
    int 0x80
.done:
    popa
    ret