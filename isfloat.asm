;Begin code

extern printf 
extern scanf 

global isfloat


;declarations

segment .data
format_string db "%f", 0 ; format string for scanf
askfloat db "Please enter a float number and press <enter>:", 10, 0
validmsg db "This is a valid input, thank you.", 10, 0
invalidmsg db "Invalid input, please try again: ", 10, 0

;code segment
segment .text

isfloat:

    ;prompt user for float input
    mov rdi, askfloat
    call printf

    ;read and validate float input, the loop will break when a valid float is given
    .isfloat_loop:
        lea rax, [rsp-8] ;reserves space for the input
        push rax ;rax does math
        push format_string ;formats for scanf
        call scanf ;pushes format string and address to store input
        add rsp, 16 
    
    ;check if input is a float
    cmp qword [rsp-8], 0 ;checks if input is zero
    je .isfloat_invalid; if zero, its invalid

    ;if valid input
    mov rdi validmsg
    call printf ;print valid message

    ret ;return 